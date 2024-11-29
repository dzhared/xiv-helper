import Foundation

/// A `developers` article.
struct LodestoneNewsDeveloper: LodestoneNews {
    let id: String
    let url: String
    let title: String
    let time: Date
    let description: String?

    var start: Date? = nil
    var end: Date? = nil
    var image: String? = nil
}

extension LodestoneNewsDeveloper {
    /// An example article for convenience.
    static let example = LodestoneNewsDeveloper(
        id: "tag:na.finalfantasyxiv.com,2024:/blog//6.3667",
        url: "https://na.finalfantasyxiv.com/blog/003667.html",
        title: "Mister Foxclon\'s Neighborhood Airs December 20!",
        time: Date(timeIntervalSince1970: 1731693600),
        description: "Greetings everyone, this is Voltenyne from the Community team! \n\nThe next episode of our housing showcase stream, Mister Foxclon\'s Neighborhood, will be airing on Friday, December 20!",
        start: nil,
        end: nil,
        image: nil
    )
}
