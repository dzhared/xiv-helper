import Foundation

/// Protocol for all news articles to conform to.
protocol LodestoneNews: Codable, Equatable, Identifiable, Sendable {
    /// The unique identifier for the article.
    var id: String { get }

    /// The URL to the full article.
    var url: String { get }

    /// The title of the article.
    var title: String { get }

    /// The time the article was published.
    var time: Date { get }

    /// The URL string of the banner image.
    var image: String? { get }

    /// The article's description.
    var description: String? { get }

    /// The start of the maintenance period.
    var start: Date? { get }

    /// The end of the maintenance period.
    var end: Date? { get }
}
