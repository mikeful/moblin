import AVFoundation
import SwiftUI

private func makeCaptureSession() -> AVCaptureSession {
    let session = AVCaptureSession()
    if #available(iOS 16.0, *) {
        if session.isMultitaskingCameraAccessSupported {
            session.isMultitaskingCameraAccessEnabled = true
        }
    }
    return session
}

protocol MixerDelegate: AnyObject {
    func mixer(
        _ mixer: Mixer,
        sessionWasInterrupted session: AVCaptureSession,
        reason: AVCaptureSession.InterruptionReason?
    )
    func mixer(_ mixer: Mixer, sessionInterruptionEnded session: AVCaptureSession)
    func mixer(_ mixer: Mixer, audioLevel: Float, numberOfAudioChannels: Int, presentationTimestamp: Double)
    func mixerVideo(_ mixer: Mixer, presentationTimestamp: Double)
    func mixerVideo(_ mixer: Mixer, failedEffect: String?)
    func mixerVideo(_ mixer: Mixer, lowFpsImage: Data?)
    func mixer(_ mixer: Mixer, recorderFinishWriting writer: AVAssetWriter)
}

/// An object that mixies audio and video for streaming.
class Mixer {
    static let defaultFrameRate: Float64 = 30

    enum MediaSync {
        case video
        case passthrough
    }

    var sessionPreset: AVCaptureSession.Preset = .hd1280x720
    let videoSession = makeCaptureSession()
    let audioSession = makeCaptureSession()
    private(set) var isRunning: Atomic<Bool> = .init(false)
    private var isEncoding = false

    var mediaSync = MediaSync.passthrough
    weak var delegate: (any MixerDelegate)?
    private var videoTimeStamp = CMTime.zero

    lazy var audio: AudioUnit = {
        var audio = AudioUnit()
        audio.mixer = self
        return audio
    }()

    lazy var video: VideoUnit = {
        var video = VideoUnit()
        video.mixer = self
        return video
    }()

    lazy var recorder: Recorder = {
        var recorder = Recorder()
        recorder.delegate = self
        return recorder
    }()

    deinit {
        if videoSession.isRunning {
            videoSession.stopRunning()
        }
        if audioSession.isRunning {
            audioSession.stopRunning()
        }
    }

    func attachCamera(_ device: AVCaptureDevice?, _ replaceVideo: UUID?) throws {
        try video.attach(device, replaceVideo)
    }

    func attachAudio(_ device: AVCaptureDevice?) throws {
        try audio.attach(device)
    }

    func useSampleBuffer(_ presentationTimeStamp: CMTime, mediaType: AVMediaType) -> Bool {
        switch mediaSync {
        case .video:
            if mediaType == .audio {
                return !videoTimeStamp.seconds.isZero && videoTimeStamp.seconds <= presentationTimeStamp
                    .seconds
            }
            if videoTimeStamp == CMTime.zero {
                videoTimeStamp = presentationTimeStamp
            }
            return true
        default:
            return true
        }
    }

    func startEncoding(_ delegate: any AudioCodecDelegate & VideoCodecDelegate) {
        guard !isEncoding else {
            return
        }
        isEncoding = true
        video.startEncoding(delegate)
        audio.startEncoding(delegate)
    }

    func stopEncoding() {
        guard isEncoding else {
            return
        }
        videoTimeStamp = CMTime.zero
        video.stopEncoding()
        audio.stopEncoding()
        isEncoding = false
    }

    func startRunning() {
        guard !isRunning.value else {
            return
        }
        addSessionObservers(videoSession)
        videoSession.startRunning()
        addSessionObservers(audioSession)
        audioSession.startRunning()
        isRunning.mutate { $0 = audioSession.isRunning }
    }

    func stopRunning() {
        guard isRunning.value else {
            return
        }
        removeSessionObservers(videoSession)
        videoSession.stopRunning()
        removeSessionObservers(audioSession)
        audioSession.stopRunning()
        isRunning.mutate { $0 = audioSession.isRunning }
    }

    private func addSessionObservers(_ session: AVCaptureSession) {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(sessionRuntimeError(_:)),
            name: .AVCaptureSessionRuntimeError,
            object: session
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(sessionInterruptionEnded(_:)),
            name: .AVCaptureSessionInterruptionEnded,
            object: session
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(sessionWasInterrupted(_:)),
            name: .AVCaptureSessionWasInterrupted,
            object: session
        )
    }

    private func removeSessionObservers(_ session: AVCaptureSession) {
        NotificationCenter.default.removeObserver(
            self,
            name: .AVCaptureSessionWasInterrupted,
            object: session
        )
        NotificationCenter.default.removeObserver(
            self,
            name: .AVCaptureSessionInterruptionEnded,
            object: session
        )
        NotificationCenter.default.removeObserver(self, name: .AVCaptureSessionRuntimeError, object: session)
    }

    @objc
    private func sessionRuntimeError(_ notification: NSNotification) {
        guard
            let errorValue = notification.userInfo?[AVCaptureSessionErrorKey] as? NSError
        else {
            return
        }
        let error = AVError(_nsError: errorValue)
        logger.info("sessionRuntimeError \(error)")
    }

    @objc
    private func sessionWasInterrupted(_ notification: Notification) {
        guard let session = notification.object as? AVCaptureSession else {
            return
        }
        guard let userInfoValue = notification.userInfo?[AVCaptureSessionInterruptionReasonKey] as AnyObject?,
              let reasonIntegerValue = userInfoValue.integerValue,
              let reason = AVCaptureSession.InterruptionReason(rawValue: reasonIntegerValue)
        else {
            delegate?.mixer(self, sessionWasInterrupted: session, reason: nil)
            return
        }
        delegate?.mixer(self, sessionWasInterrupted: session, reason: reason)
    }

    @objc
    private func sessionInterruptionEnded(_: Notification) {
        delegate?.mixer(self, sessionInterruptionEnded: videoSession)
    }
}

extension Mixer: IORecorderDelegate {
    func recorder(_: Recorder, finishWriting writer: AVAssetWriter) {
        delegate?.mixer(self, recorderFinishWriting: writer)
    }
}