/// A simplified recipe for display on an item's detail view.
struct ItemRecipe: Codable {

    // MARK: Properties

    /// The resulting item's ID.
    let id: Int

    /// The ClassJob ID for the recipe.
    let classJob: Int

    /// The DoH class level needed for the recipe.
    let lvl: Int

    /// The number of stars for the recipe.
    let stars: Int

    /// The number of items the recipe yields.
    let yields: Int
}
