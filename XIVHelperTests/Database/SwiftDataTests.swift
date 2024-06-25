import XCTest
import SwiftData

@testable import XIV_Helper

final class SwiftDataTests: XCTestCase {

    var container: ModelContainer!
    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var items: [Item]!
    var recipes: [Recipe]!
    var userRecipes: [UserRecipe]!

    @MainActor override func setUp() {
        container = TestContainer
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        items = []
        recipes = []
        userRecipes = []
    }

    @MainActor override func tearDown() {
        container = nil
        decoder = nil
        encoder = nil
        items = nil
        recipes = nil
        userRecipes = nil
    }

    /// All recipes can be fetched from the model context, and using them to initialize an
    /// `ItemDetailView` does not throw any errors.
    @MainActor func testAllItems() throws {
        let descriptor = FetchDescriptor<Item>()
        items = try container.mainContext.fetch(descriptor)
        XCTAssertEqual(items.count, 38_970)
        for item in items {
            let _ = ItemDetailView(itemID: item.id)
            let _ = ItemDetailView(item: item)
        }
    }

    /// All recipes can be fetched from the model context, and using them to initialize a
    /// `RecipeDetailView` does not throw any errors.
    @MainActor func testAllRecipes() throws {
        let descriptor = FetchDescriptor<Recipe>()
        recipes = try container.mainContext.fetch(descriptor)
        XCTAssertEqual(recipes.count, 10_851)
        for recipe in recipes {
            let _ = RecipeDetailView(recipe: recipe)
            let _ = RecipeDetailView(recipeID: recipe.id)
        }
    }

    /// The decoded container does not include any `UserRecipe` objects by default.
    @MainActor func testNoUserRecipes() throws {
        let descriptor = FetchDescriptor<UserRecipe>()
        userRecipes = try container.mainContext.fetch(descriptor)
        XCTAssertEqual(userRecipes.count, 0)
    }
}
