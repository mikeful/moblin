import AVFoundation
import CoreImage

open class VideoEffect: NSObject {
    open func getName() -> String {
        return ""
    }

    open func execute(_ image: CIImage) -> CIImage {
        image
    }
}