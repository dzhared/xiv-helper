import Foundation

/// A `maintenance` article.
struct LodestoneNewsMaintenance: LodestoneNews {
    let id: String
    let url: String
    let title: String
    let time: Date
    let start: Date?
    let end: Date?

    var image: String? = nil
    var description: String? = nil
}

extension LodestoneNewsMaintenance {
    /// An example article for convenience.
    static let example = LodestoneNewsMaintenance(
        id: "4700b7611ffbf85f352e26559febe40185dcbecb",
        url: "https://na.finalfantasyxiv.com/lodestone/news/detail/4700b7611ffbf85f352e26559febe40185dcbecb",
        title: "Support Center Maintenance (Nov. 30)",
        time: Date(timeIntervalSince1970: 1732420800),
        start: Date(timeIntervalSince1970: 1733025600),
        end: Date(timeIntervalSince1970: 1733036400),
        image: nil,
        description: nil
    )
}
