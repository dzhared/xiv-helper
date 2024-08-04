import SwiftData

/// The SwiftData object to store recipes the user has saved.
@Model class UserRecipe: Codable, Equatable {

    // MARK: Properties

    /// The number of the recipe desired.
    var quantity: Int

    /// The recipe.
    @Attribute(.unique) let recipe: Recipe

    // MARK: Initialization

    /// Initialize using a `Recipe` object. Used in `RecipeDetailView`.
    init(recipe: Recipe, quantity: Int = 1) {
        self.recipe = recipe
        self.quantity = quantity
    }

    // MARK: Codable

    enum CodingKeys: CodingKey {
        case quantity
        case recipe
    }

    // MARK: Decodable

    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.quantity = try container.decode(Int.self, forKey: .quantity)
        self.recipe = try container.decode(Recipe.self, forKey: .recipe)
    }

    // MARK: Encodable

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.quantity, forKey: .quantity)
        try container.encode(self.recipe, forKey: .recipe)
    }
}
