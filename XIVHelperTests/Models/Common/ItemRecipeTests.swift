import XCTest

@testable import XIV_Helper

final class ItemRecipeTests: XCTestCase {

    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var itemRecipe: ItemRecipe!

    override func setUp() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        itemRecipe = ItemRecipe(
            id: 5,
            classJob: 35,
            lvl: 100,
            stars: 2,
            yields: 3
        )
    }

    override func tearDown() {
        decoder = nil
        encoder = nil
        itemRecipe = nil
    }

    /// The `ItemRecipe` encodes and decodes correctly.
    func testItemRecipeEncodeDecode() throws {
        let encoded = try encoder.encode(itemRecipe)
        let decoded = try decoder.decode(ItemRecipe.self, from: encoded)
        XCTAssertEqual(decoded, itemRecipe)
    }
}
