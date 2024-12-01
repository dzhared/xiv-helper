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
        XCTAssertEqual(items.count, 42_550)

        for item in items {
            // The items have all four localized names.
            XCTAssertNotEqual(item.name.en, "")
            XCTAssertNotEqual(item.name.de, "")
            XCTAssertNotEqual(item.name.fr, "")
            XCTAssertNotEqual(item.name.ja, "")
        }
    }

    /// All recipes can be fetched from the model context, and using them to initialize a
    /// `RecipeDetailView` does not throw any errors.
    @MainActor func testAllRecipes() throws {
        let descriptor = FetchDescriptor<Recipe>()
        recipes = try container.mainContext.fetch(descriptor)
        XCTAssertEqual(recipes.count, 11_803)

        for recipe in recipes {
            // The resulting items have all four localized names.
            XCTAssertNotEqual(recipe.resultName.en, "")
            XCTAssertNotEqual(recipe.resultName.de, "")
            XCTAssertNotEqual(recipe.resultName.fr, "")
            XCTAssertNotEqual(recipe.resultName.ja, "")
        }
    }

    /// Items from 7.01, 7.05, and 7.11 are present and contain the correct information.
    @MainActor func testNewItems() throws {
        var descriptor = FetchDescriptor<Item>(predicate: #Predicate<Item> { $0.id == 41112 })
        items = try container.mainContext.fetch(descriptor)
        var result = items.first
        XCTAssertEqual(result?.id, 41112)
        XCTAssertEqual(result?.name.en, "Sake Barrel")
        XCTAssertEqual(result?.patchId, 97)

        descriptor = FetchDescriptor<Item>(predicate: #Predicate<Item> { $0.id == 42818 })
        result = try container.mainContext.fetch(descriptor).first
        XCTAssertEqual(result?.id, 42818)
        XCTAssertEqual(result?.name.en, "Light-heavy Breeches of Fending")
        XCTAssertEqual(result?.patchId, 96)

        descriptor = FetchDescriptor<Item>(predicate: #Predicate<Item> { $0.id == 44721 })
        result = try container.mainContext.fetch(descriptor).first
        XCTAssertEqual(result?.id, 44721)
        XCTAssertEqual(result?.name.en, "Ultimate Edenmorn Bastard Sword")
        XCTAssertEqual(result?.patchId, 99)
    }

    /// The decoded container does not include any `UserRecipe` objects by default.
    @MainActor func testNoUserRecipes() throws {
        let descriptor = FetchDescriptor<UserRecipe>()
        userRecipes = try container.mainContext.fetch(descriptor)
        XCTAssertEqual(userRecipes.count, 0)
    }
}
