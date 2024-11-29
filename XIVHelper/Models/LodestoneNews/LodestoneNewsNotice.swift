import Foundation

/// A `notices` article.
struct LodestoneNewsNotice: LodestoneNews {
    let id: String
    let url: String
    let title: String
    let time: Date

    var image: String? = nil
    var description: String? = nil
    var start: Date? = nil
    var end: Date? = nil
}

extension LodestoneNewsNotice {
    /// An example article for convenience.
    static let example = LodestoneNewsNotice(
        id: "af8edf735e83f646a3e75ee6e7e9b8065a50eb27",
        url: "https://na.finalfantasyxiv.com/lodestone/news/detail/af8edf735e83f646a3e75ee6e7e9b8065a50eb27",
        title: "Actions Taken Against In-Game RMT & Other Illicit Activities (Nov. 28)",
        time: Date(timeIntervalSince1970: 1732780800),
        image: nil,
        description: nil,
        start: nil,
        end: nil
    )
}
