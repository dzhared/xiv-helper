import XCTest

@testable import XIV_Helper

final class IngredientTests: XCTestCase {

    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var ingredient: Ingredient!

    override func setUp() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        ingredient = Ingredient(
            id: 5106,
            ingredientItemIcon: "/i/021000/021209_hr1.png",
            name: LocalizedString(en: "Copper Ore", ja: "銅鉱", de: "Kupfererz", fr: "Minerai de cuivre"),
            quantity: 2
        )
    }

    override func tearDown() {
        decoder = nil
        encoder = nil
        ingredient = nil
    }

    /// The computed properties initialize correctly.
    func testIngredientComputedProperties() {
        /// The icon `URL` initializes correctly.
        XCTAssertEqual(ingredient.icon, URL(string: "https://xivapi.com/i/021000/021209_hr1.png")!)
    }

    /// The Ingredient encodes and decodes as expected.
    func testIngredientEncodeDecode() throws {
        let encoded = try encoder.encode(ingredient)
        let decoded = try decoder.decode(Ingredient.self, from: encoded)
        XCTAssertEqual(decoded, ingredient)
    }
}
