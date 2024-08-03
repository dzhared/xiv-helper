import XCTest
import SwiftData

@testable import XIV_Helper

final class IngredientsListBuilderTests: XCTestCase {

    var builder: IngredientsListBuilder!
    var container: ModelContainer!

    @MainActor override func setUp() {
        super.setUp()

        container = previewContainer
        builder = IngredientsListBuilder(context: container.mainContext)
    }

    override func tearDown() {
        super.tearDown()

        builder = nil
        container = nil
    }

    @MainActor func testIngredientsListBuilder() {
        let ingredients: [Ingredient] = [
            Ingredient(id: 5367, ingredientItemIcon: "/i/022000/022457_hr1.png", name: LocalizedString(en: "Elm Lumber"), quantity: 5),
            Ingredient(id: 5277, ingredientItemIcon: "/i/022000/022007_hr1.png", name: LocalizedString(en: "Aldgoat Leather"), quantity: 5),
            Ingredient(id: 5111, ingredientItemIcon: "/i/021000/021202_hr1.png", name: LocalizedString(en: "Iron Ore"), quantity: 15),
            Ingredient(id: 5057, ingredientItemIcon: "/i/020000/020801_hr1.png", name: LocalizedString(en: "Iron Ingot"), quantity: 10),
            Ingredient(id: 5, ingredientItemIcon: "/i/020000/020006_hr1.png", name: LocalizedString(en: "Earth Shard"), quantity: 5),
            Ingredient(id: 2, ingredientItemIcon: "/i/020000/020001_hr1.png", name: LocalizedString(en: "Fire Shard"), quantity: 15),
        ]
        let expected: [Ingredient] = [
            // Alumen x5
            Ingredient(id: 5524, ingredientItemIcon: "/i/022000/022616_hr1.png", name: LocalizedString(en: "Alumen"), quantity: 5),
            // Elm Log x15
            Ingredient(id: 5385, ingredientItemIcon: "/i/022000/022405_hr1.png", name: LocalizedString(en: "Elm Log"), quantity: 15),
            // Aldgoat Skin x5
            Ingredient(id: 5296, ingredientItemIcon: "/i/021000/021814_hr1.png", name: LocalizedString(en: "Aldgoat Skin"), quantity: 5),
            // Iron Ore x45
            Ingredient(id: 5111, ingredientItemIcon: "/i/021000/021202_hr1.png", name: LocalizedString(en: "Iron Ore"), quantity: 45),
            // Earth Shard x10
            Ingredient(id: 5, ingredientItemIcon: "/i/020000/020006_hr1.png", name: LocalizedString(en: "Earth Shard"), quantity: 10),
            // Wind Shard x5
            Ingredient(id: 4, ingredientItemIcon: "/i/020000/020004_hr1.png", name: LocalizedString(en: "Wind Shard"), quantity: 5),
            // Fire Shard x25
            Ingredient(id: 2, ingredientItemIcon: "/i/020000/020001_hr1.png", name: LocalizedString(en: "Fire Shard"), quantity: 25),
        ]

        // For each expected result, there is an actual result with a matching ID and quantity.
        var results = builder.buildIngredientsList(from: ingredients)

        for e in expected {
            if let index = results.firstIndex(where: {
                $0.quantity == e.quantity &&
                $0.id == e.id &&
                $0.icon == e.icon &&
                $0.name.en == e.name.en
            }) {
                results.remove(at: index)
            }
        }

        // After removing all matches, results should be empty.
        XCTAssertEqual(results, [])
    }
}
