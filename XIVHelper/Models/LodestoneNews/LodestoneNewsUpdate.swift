import Foundation

/// An `update` article.
struct LodestoneNewsUpdate: LodestoneNews {
    let id: String
    let url: String
    let title: String
    let time: Date

    var start: Date? = nil
    var end: Date? = nil
    var image: String? = nil
    var description: String? = nil
}

extension LodestoneNewsUpdate {
    /// An example article for convenience.
    static let example = LodestoneNewsUpdate(
        id: "6b04e96b5b9b08f350a3a11791e8b762a0ca2573",
        url: "https://na.finalfantasyxiv.com/lodestone/news/detail/6b04e96b5b9b08f350a3a11791e8b762a0ca2573",
        title: "FINAL FANTASY XIV Updated (Nov. 28)",
        time: Date(timeIntervalSince1970: 1732818600),
        start: nil,
        end: nil,
        image: nil,
        description: nil
    )
}
