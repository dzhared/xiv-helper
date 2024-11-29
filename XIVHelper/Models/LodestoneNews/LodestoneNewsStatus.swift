import Foundation

/// A `status` article.
struct LodestoneNewsStatus: LodestoneNews {
    let id: String
    let url: String
    let title: String
    let time: Date

    var start: Date? = nil
    var end: Date? = nil
    var image: String? = nil
    var description: String? = nil
}

extension LodestoneNewsStatus {
    /// An example article for convenience.
    static let example = LodestoneNewsStatus(
        id: "b39b05782bbc29c299901db3d9f100c2b41cf097",
        url: "https://na.finalfantasyxiv.com/lodestone/news/detail/b39b05782bbc29c299901db3d9f100c2b41cf097",
        title: "[Dynamis] Recovery from Kraken World Technical Difficulties (Nov. 28)",
        time: Date(timeIntervalSince1970: 1732821300),
        start: nil,
        end: nil,
        image: nil,
        description: nil
    )
}
