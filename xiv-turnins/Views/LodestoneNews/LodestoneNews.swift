import Foundation

// MARK: - LodestoneNews

struct LodestoneNews: Codable {
    
    // MARK: Properties
    
    let id, title, image, description: String
    private let url: String
    private let time: Date
    
    var formattedURL: URL {
        URL(string: url)!
    }
    
    var formattedImageURL: URL {
        URL(string: image)!
    }
    
    var formattedTime: String {
        time.formatted(date: .abbreviated, time: .omitted)
    }
    
    // MARK: Example
    
    static let example: LodestoneNews = LodestoneNews(
        id: "0bb6b9ddf074dcf3738acddd4391b9d9b3b0c54c",
        title: "Letter from the Producer LIVE Part LXIV Digest Released",
        image: "https://na.finalfantasyxiv.com/lodestone/topics/detail/0bb6b9ddf074dcf3738acddd4391b9d9b3b0c54c",
        description: "We’re pleased to announce that the Letter from the Producer LIVE Part LXIV event digest has been released!\n\nIf you weren’t able to watch the live stream, or if you just want to watch it again, be sure to check it out!",
        url: "https://na.finalfantasyxiv.com/lodestone/topics/detail/0bb6b9ddf074dcf3738acddd4391b9d9b3b0c54c",
        time: Date(timeIntervalSince1970: 1622102400)
    )
}
