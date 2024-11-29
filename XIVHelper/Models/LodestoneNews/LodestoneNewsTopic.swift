import Foundation

/// A `topics` article.
struct LodestoneNewsTopic: LodestoneNews {

    // MARK: Properties

    let id: String
    let url: String
    let title: String
    let time: Date
    let image: String?
    let description: String?

    var start: Date? = nil
    var end: Date? = nil
}

// MARK: Example

extension LodestoneNewsTopic {
    /// An example article for convenience.
    static let example = LodestoneNewsTopic(
        id: "f8506f4808c8db5d061b31eb511dc946902712f4",
        url: "https://na.finalfantasyxiv.com/lodestone/topics/detail/f8506f4808c8db5d061b31eb511dc946902712f4",
        title: "Patch 7.11 Notes",
        time: Date(timeIntervalSince1970: 1732591800),
        image: "https://img.finalfantasyxiv.com/t/f8506f4808c8db5d061b31eb511dc946902712f4.png?1732592135",
        description: "Patch 7.11 adds a variety of new items as well as the sixth ultimate duty, Futures Rewritten.\n\n\n* Additional features will be implemented in future updates: A new custom deliveries client (Nitowikwe), Wachumeqimeqi quests, and Inconceivably Further Hildibrand Adventures sidequests are scheduled to be released in Patch 7.15. The Cloud of Darkness (Chaotic) is scheduled to be released one week after Patch 7.15. Additional role quests are scheduled to be released in Patch 7.16.\n\nRead the patch notes.",
        start: nil,
        end: nil
    )
}
