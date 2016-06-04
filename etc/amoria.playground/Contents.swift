/* AMORIA ^_^ */

struct Resolution {
    var width = 0.5
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

var video = VideoMode()

video.resolution.width = 0.7

Resolution(width: 0.4, height: 33)

print("resolution is \(video.resolution.width)")