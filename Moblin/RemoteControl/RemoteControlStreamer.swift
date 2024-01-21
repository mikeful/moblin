import Foundation

protocol RemoteControlStreamerDelegate: AnyObject {
    func connected()
    func disconnected()
    func getStatus(onComplete: @escaping (RemoteControlStatusTopLeft, RemoteControlStatusTopRight) -> Void)
    func getSettings(onComplete: @escaping (RemoteControlSettings) -> Void)
    func setScene(id: UUID, onComplete: @escaping () -> Void)
    func setBitratePreset(id: UUID, onComplete: @escaping () -> Void)
    func setZoom(x: Float, onComplete: @escaping () -> Void)
}

private func randomString() -> String {
    return Data.random(length: 64).base64EncodedString()
}

class RemoteControlStreamer {
    private var clientUrl: URL
    private var password: String
    private weak var delegate: (any RemoteControlStreamerDelegate)?
    private var webSocket: URLSessionWebSocketTask
    private var task: Task<Void, Error>?
    private var clientIdentified: Bool = false
    private var challenge: String = ""
    private var salt: String = ""
    private var connected = false

    init(clientUrl: URL, password: String, delegate: RemoteControlStreamerDelegate) {
        self.clientUrl = clientUrl
        self.password = password
        self.delegate = delegate
        webSocket = URLSession(configuration: .default).webSocketTask(with: clientUrl)
    }

    func start() {
        stop()
        logger.info("remote-control-streamer: start")
        task = Task.init {
            while true {
                setupConnection()
                do {
                    try await receiveMessages()
                } catch {
                    logger.debug("remote-control-streamer: error: \(error.localizedDescription)")
                }
                if Task.isCancelled {
                    logger.debug("remote-control-streamer: Cancelled")
                    break
                }
                if connected {
                    delegate?.disconnected()
                    connected = false
                }
                logger.debug("remote-control-streamer: Disconnected")
                try await Task.sleep(nanoseconds: 5_000_000_000)
                logger.debug("remote-control-streamer: Reconnecting")
            }
        }
    }

    func stop() {
        logger.info("remote-control-streamer: stop")
        task?.cancel()
        task = nil
        connected = false
    }

    private func setupConnection() {
        webSocket = URLSession.shared.webSocketTask(with: clientUrl)
        webSocket.resume()
        challenge = randomString()
        salt = randomString()
        send(message: .event(data: .hello(
            apiVersion: remoteControlApiVersion,
            authentication: .init(challenge: challenge, salt: salt)
        )))
        clientIdentified = false
    }

    private func send(message: RemoteControlMessageToClient) {
        do {
            try webSocket.send(.string(message.toJson())) { _ in }
        } catch {
            logger.info("remote-control-streamer: Encode failed")
        }
    }

    private func receiveMessages() async throws {
        while true {
            let message = try await webSocket.receive()
            if Task.isCancelled {
                break
            }
            switch message {
            case let .data(message):
                logger.debug("remote-control-streamer: Got data \(message)")
            case let .string(message):
                logger.debug("remote-control-streamer: Got message \(message)")
                do {
                    switch try RemoteControlMessageToServer.fromJson(data: message) {
                    case let .request(id: id, data: data):
                        handleRequest(id: id, data: data)
                    }
                } catch {
                    logger.info("remote-control-streamer: Decode failed")
                }
            default:
                logger.debug("remote-control-streamer: ???")
            }
        }
    }

    private func handleRequest(id: Int, data: RemoteControlRequest) {
        guard let delegate else {
            return
        }
        var result: RemoteControlResult?
        if clientIdentified {
            switch data {
            case .getStatus:
                delegate.getStatus { topLeft, topRight in
                    self.send(message: .response(
                        id: id,
                        result: .ok,
                        data: .getStatus(topLeft: topLeft, topRight: topRight)
                    ))
                }
            case .getSettings:
                delegate.getSettings { data in
                    self.send(message: .response(id: id, result: .ok, data: .getSettings(data: data)))
                }
            case let .setScene(id: sceneId):
                delegate.setScene(id: sceneId) {
                    self.send(message: .response(id: id, result: .ok, data: nil))
                }
            case let .setBitratePreset(id: bitratePresetId):
                delegate.setBitratePreset(id: bitratePresetId) {
                    self.send(message: .response(id: id, result: .ok, data: nil))
                }
            case let .setZoom(x: x):
                delegate.setZoom(x: x) {
                    self.send(message: .response(id: id, result: .ok, data: nil))
                }
            case .identify:
                result = .alreadyIdentified
            default:
                result = .unknownRequest
            }
        } else {
            switch data {
            case let .identify(authentication: authentication):
                if authentication == remoteControlHashPassword(
                    challenge: challenge,
                    salt: salt,
                    password: password
                ) {
                    clientIdentified = true
                    connected = true
                    delegate.connected()
                    result = .ok
                } else {
                    result = .wrongPassword
                }
            default:
                result = .notIdentified
            }
        }
        if let result {
            send(message: .response(id: id, result: result, data: nil))
        }
    }
}