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

    override func setUp() {
        container = testContainer
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        items = []
        recipes = []
        userRecipes = []
    }

    override func tearDown() {
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
        XCTAssertEqual(items.count, 42_525)

        // Rendering any ItemDetailView, either from the item or its id, does not throw an error.
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
        XCTAssertEqual(recipes.count, 11_803)
        for recipe in recipes {
            let _ = RecipeDetailView(recipe: recipe)
            let _ = RecipeDetailView(recipeID: recipe.id)
        }
    }

    /// Items from 7.01 and 7.05 are present and contain the correct information.
    @MainActor func testNewItems() throws {
        var descriptor = FetchDescriptor<Item>(predicate: #Predicate<Item> { $0.id == 41112 })
        items = try container.mainContext.fetch(descriptor)
        var result = items.first
        XCTAssertEqual(result?.id, 41112)
        XCTAssertEqual(result?.name.en, "Sake Barrel")
        XCTAssertEqual(result?.patchId, 97)

        descriptor = FetchDescriptor<Item>(predicate: #Predicate<Item> { $0.id == 42818 })
        items = try container.mainContext.fetch(descriptor)
        result = items.first
        XCTAssertEqual(result?.id, 42818)
        XCTAssertEqual(result?.name.en, "Light-heavy Breeches of Fending")
        XCTAssertEqual(result?.patchId, 96)
    }

    /// The decoded container does not include any `UserRecipe` objects by default.
    @MainActor func testNoUserRecipes() throws {
        let descriptor = FetchDescriptor<UserRecipe>()
        userRecipes = try container.mainContext.fetch(descriptor)
        XCTAssertEqual(userRecipes.count, 0)
    }

    @MainActor func testAllItemsHaveLocalizedNames() throws {
        let descriptor = FetchDescriptor<Item>()
        items = try container.mainContext.fetch(descriptor)
        XCTAssertEqual(items.count, 42_525)
        for item in items {
            XCTAssertNotEqual(item.name.en, "")
            XCTAssertNotEqual(item.name.de, "")
            XCTAssertNotEqual(item.name.fr, "")
            XCTAssertNotEqual(item.name.ja, "")
        }
    }

    /// All recipes in the
    @MainActor func testAllRecipesHaveLocalizedNames() throws {
        let descriptor = FetchDescriptor<Recipe>()
        recipes = try container.mainContext.fetch(descriptor)
        XCTAssertEqual(recipes.count, 11803)
        for recipe in recipes {
            XCTAssertNotEqual(recipe.resultName.de, "")
            XCTAssertNotEqual(recipe.resultName.fr, "")
            XCTAssertNotEqual(recipe.resultName.ja, "")
        }
    }
}
