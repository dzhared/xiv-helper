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
            // Ginseng Lumber x10
            Ingredient(id: 44019, ingredientItemIcon: "/i/022000/022457_hr1.png", name: LocalizedString(en: "Ginseng Lumber"), quantity: 10),
            // Enchanted High Durium Ink x10
            Ingredient(id: 36237, ingredientItemIcon: "/i/025000/025923_hr1.png", name: LocalizedString(en: "Enchanted High Durium Ink"), quantity: 10),
            // High Durium Sand x40
            Ingredient(id: 36162, ingredientItemIcon: "/i/021000/021242_hr1.png", name: LocalizedString(en: "High Durium Sand"), quantity: 40),
            // Cubus Flesh x10
            Ingredient(id: 27799, ingredientItemIcon: "/i/025000/025156_hr1.png", name: LocalizedString(en: "Cubus Flesh"), quantity: 10),
            // Underground Spring Water x10
            Ingredient(id: 27782, ingredientItemIcon: "/i/022000/022678_hr1.png", name: LocalizedString(en: "Underground Spring Water"), quantity: 10),
            // Rush Grash x20
            Ingredient(id: 8021, ingredientItemIcon: "/i/021000/021653_hr1.png", name: LocalizedString(en: "Rush Grass"), quantity: 20),
            // Water Crystal x80
            Ingredient(id: 13, ingredientItemIcon: "/i/020000/020008_hr1.png", name: LocalizedString(en: "Water Crystal"), quantity: 80),
            // Wind Crystal x40
            Ingredient(id: 10, ingredientItemIcon: "/i/020000/020010_hr1.png", name: LocalizedString(en: "Wind Crystal"), quantity: 40),
            // Ice Crystal x40
            Ingredient(id: 9, ingredientItemIcon: "/i/020000/020009_hr1.png", name: LocalizedString(en: "Ice Crystal"), quantity: 40),
        ]
        var expected: [Ingredient] = [
            // Ginseng Log x50
            Ingredient(id: 44014, ingredientItemIcon: "/i/022000/022405_hr1.png", name: LocalizedString(en: "Ginseng Log"), quantity: 50),
            // High Durium Sand x80
            Ingredient(id: 36162, ingredientItemIcon: "/i/021000/021242_hr1.png", name: LocalizedString(en: "High Durium Sand"), quantity: 80),
            // Cubus Flesh x20
            Ingredient(id: 27799, ingredientItemIcon: "/i/025000/025156_hr1.png", name: LocalizedString(en: "Cubus Flesh"), quantity: 20),
            // Underground Spring Water x20
            Ingredient(id: 27782, ingredientItemIcon: "/i/022000/022678_hr1.png", name: LocalizedString(en: "Underground Spring Water"), quantity: 20),
            // Rush Grass x20
            Ingredient(id: 8021, ingredientItemIcon: "/i/021000/021653_hr1.png", name: LocalizedString(en: "Rush Grass"), quantity: 20),
            // Water Crystal x160
            Ingredient(id: 13, ingredientItemIcon: "/i/020000/020008_hr1.png", name: LocalizedString(en: "Water Crystal"), quantity: 160),
            // Wind Crystal x120
            Ingredient(id: 10, ingredientItemIcon: "/i/020000/020010_hr1.png", name: LocalizedString(en: "Wind Crystal"), quantity: 120),
            // Ice Crystal x40
            Ingredient(id: 9, ingredientItemIcon: "/i/020000/020009_hr1.png", name: LocalizedString(en: "Ice Crystal"), quantity: 40),
        ]

        // For each expected result, there is an actual result with a matching ID and quantity.
        var results = builder.buildIngredientsList(from: ingredients)

        // Sort to avoid errors due to array order mismatch
        results.sort(by: { $0.id < $1.id })
        expected.sort(by: { $0.id < $1.id })

        XCTAssertEqual(results, expected)
    }
}
