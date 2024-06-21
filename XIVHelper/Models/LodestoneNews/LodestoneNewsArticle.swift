import Foundation

/// The data for a given Lodestone News article.
struct LodestoneNewsArticle: Codable, Equatable {

    // MARK: Properties

    /// The unique identifier for the article.
    let id: String

    /// The description for the article.
    let description: String

    /// The image URL for the article.
    let image: String

    /// The date the article was published.
    let time: Date

    /// The title of the article.
    let title: String

    /// The URL to the full article.
    let url: String
}

// MARK: Example

extension LodestoneNewsArticle {
    /// An example article for convenience.
    static let example = LodestoneNewsArticle(
        id: "0bb6b9ddf074dcf3738acddd4391b9d9b3b0c54c",
        description: "We’re pleased to announce that the Letter from the Producer LIVE Part LXIV event digest has been released!\n\nIf you weren’t able to watch the live stream, or if you just want to watch it again, be sure to check it out!",
        image: "https://img.finalfantasyxiv.com/t/0bb6b9ddf074dcf3738acddd4391b9d9b3b0c54c.png?1622102284",
        time: Date(timeIntervalSince1970: 1622102400),
        title: "Letter from the Producer LIVE Part LXIV Digest Released",
        url: "https://na.finalfantasyxiv.com/lodestone/topics/detail/0bb6b9ddf074dcf3738acddd4391b9d9b3b0c54c"
    )
}
