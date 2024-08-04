import XCTest

@testable import XIV_Helper

final class ItemCategoryTests: XCTestCase {

    var itemCategory: ItemCategory!

    override func setUp() {
        // Set up inside each test
    }

    override func tearDown() {
        itemCategory = nil
    }

    /// A known ID initializes an `ItemCategory` correctly.
    func testItemCategoryFromId() {
        /// Initialize with a known ID.
        itemCategory = ItemCategory(id: 5)
        XCTAssertEqual(itemCategory.name.en, "Lancer's Arm")

        /// `39`, the obsolete ID for belts, returns "Unobtainable," not "Belt"
        itemCategory = ItemCategory(id: 39)
        XCTAssertEqual(itemCategory.name.en, "Unobtainable")

        /// An unknown ID returns "Other".
        itemCategory = ItemCategory(id: 1_000_000)
        XCTAssertEqual(itemCategory.name.en, "Other")

        /// Dawntrail categories initialize properly.
        itemCategory = ItemCategory(id: 110)
        XCTAssertEqual(itemCategory.name.en, "Viper's Arm")
        itemCategory = ItemCategory(id: 111)
        XCTAssertEqual(itemCategory.name.en, "Pictomancer's Arm")
    }
}
