import XCTest
import SwiftData

@testable import XIV_Helper

final class RecipeTests: XCTestCase {

    var container: ModelContainer!
    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var recipe: Recipe!

    @MainActor override func setUp() {
        container = previewContainer
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        recipe = .example
    }

    override func tearDown() {
        container = nil
        decoder = nil
        encoder = nil
        recipe = nil
    }

    /// The computed properties initialize correctly.
    func testRecipeComputedProperties() {
        /// The icon `URL` initializes correctly.
        XCTAssertEqual(recipe .icon, URL(string: "https://xivapi.com/i/024000/024030_hr1.png")!)

        /// The recipe `ClassJob` initializes correctly.
        XCTAssertEqual(recipe.classJob, ClassJob(id: 15))

        /// The recipe's master recipe book icon `URL` initializes correctly.
        XCTAssertEqual(recipe.masterbookIcon, URL(string: "https://xivapi.com/i/026000/026156_hr1.png")!)
    }

    /// The `Recipe` encodes and decodes as expected.
    func testRecipeEncodeDecode() throws {
        let encoded = try encoder.encode(recipe)
        let decoded = try decoder.decode(Recipe.self, from: encoded)
        XCTAssertEqual(decoded.canHq, recipe.canHq)
        XCTAssertEqual(decoded.canQs, recipe.canQs)
        XCTAssertEqual(decoded.classJob, recipe.classJob)
        XCTAssertEqual(decoded.classJobLevel, recipe.classJobLevel)
        XCTAssertEqual(decoded.durability, recipe.durability)
        XCTAssertEqual(decoded.expert, recipe.expert)
        XCTAssertEqual(decoded.icon, recipe.icon)
        XCTAssertEqual(decoded.id, recipe.id)
        XCTAssertEqual(decoded.ingredients, recipe.ingredients)
        XCTAssertEqual(decoded.masterbookIcon, recipe.masterbookIcon)
        XCTAssertEqual(decoded.masterbookId, recipe.masterbookId)
        XCTAssertEqual(decoded.masterbookName, recipe.masterbookName)
        XCTAssertEqual(decoded.progress, recipe.progress)
        XCTAssertEqual(decoded.quality, recipe.quality)
        XCTAssertEqual(decoded.recipeLevel, recipe.recipeLevel)
        XCTAssertEqual(decoded.requiredControl, recipe.requiredControl)
        XCTAssertEqual(decoded.requiredCraftsmanship, recipe.requiredCraftsmanship)
        XCTAssertEqual(decoded.requiredQuality, recipe.requiredQuality)
        XCTAssertEqual(decoded.resultId, recipe.resultId)
        XCTAssertEqual(decoded.resultIlvl, recipe.resultIlvl)
        XCTAssertEqual(decoded.resultItem, recipe.resultItem)
        XCTAssertEqual(decoded.resultItemCategory, recipe.resultItemCategory)
        XCTAssertEqual(decoded.resultName, recipe.resultName)
        XCTAssertEqual(decoded.resultPatch, recipe.resultPatch)
        XCTAssertEqual(decoded.stars, recipe.stars)
        XCTAssertEqual(decoded.suggestedControl, recipe.suggestedControl)
        XCTAssertEqual(decoded.suggestedCraftsmanship, recipe.suggestedCraftsmanship)
        XCTAssertEqual(decoded.yields, recipe.yields)
    }

    /// The `Recipe` inserts and fetches from the model context as expected.
    @MainActor func testRecipeFetch() throws {
        container.mainContext.insert(recipe)
        let retrieved = try XCTUnwrap(
            container.mainContext.fetch(
                FetchDescriptor<Recipe>(
                    predicate: #Predicate<Recipe> {
                        $0.id == recipe.id &&
                        $0.masterbookId == recipe.masterbookId // Recipe has no masterbook in prod.
                    })
            )
            .first
        )
        XCTAssertEqual(retrieved.canHq, recipe.canHq)
        XCTAssertEqual(retrieved.canQs, recipe.canQs)
        XCTAssertEqual(retrieved.classJob, recipe.classJob)
        XCTAssertEqual(retrieved.classJobLevel, recipe.classJobLevel)
        XCTAssertEqual(retrieved.durability, recipe.durability)
        XCTAssertEqual(retrieved.expert, recipe.expert)
        XCTAssertEqual(retrieved.icon, recipe.icon)
        XCTAssertEqual(retrieved.id, recipe.id)
        XCTAssertEqual(retrieved.masterbookIcon, recipe.masterbookIcon)
        XCTAssertEqual(retrieved.masterbookId, recipe.masterbookId)
        XCTAssertEqual(retrieved.masterbookName, recipe.masterbookName)
        XCTAssertEqual(retrieved.progress, recipe.progress)
        XCTAssertEqual(retrieved.quality, recipe.quality)
        XCTAssertEqual(retrieved.recipeLevel, recipe.recipeLevel)
        XCTAssertEqual(retrieved.requiredControl, recipe.requiredControl)
        XCTAssertEqual(retrieved.requiredCraftsmanship, recipe.requiredCraftsmanship)
        XCTAssertEqual(retrieved.requiredQuality, recipe.requiredQuality)
        XCTAssertEqual(retrieved.resultId, recipe.resultId)
        XCTAssertEqual(retrieved.resultIlvl, recipe.resultIlvl)
        XCTAssertEqual(retrieved.resultItemCategory, recipe.resultItemCategory)
        XCTAssertEqual(retrieved.resultName, recipe.resultName)
        XCTAssertEqual(retrieved.resultPatch, recipe.resultPatch)
        XCTAssertEqual(retrieved.stars, recipe.stars)
        XCTAssertEqual(retrieved.suggestedControl, recipe.suggestedControl)
        XCTAssertEqual(retrieved.suggestedCraftsmanship, recipe.suggestedCraftsmanship)
        XCTAssertEqual(retrieved.yields, recipe.yields)
    }

    // TODO: Unit test to catch any missing icons instead of manually searching JSON
}
