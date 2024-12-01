import XCTest

@testable import XIV_Helper

final class SettingsManagerTests: XCTestCase {

    var subject: SettingsManager!

    override func setUp() {
        super.setUp()
        subject = SettingsManager.shared
    }

    override func tearDown() {
        super.tearDown()
        subject = nil
    }

    /// The settings manager's reset to defaults function resets correctly.
    func testSettingsManagerResetToDefault() {

        // These settings not changed by resetSettings()
        subject.currentStoreName = "xivhelper-1.9.0"
        subject.selectedTab = 1

        // General
        subject.locale = .ja

        // Item
        subject.hq = false

        // Items Search
        subject.searchItemCraftableOnly = true
        subject.searchItemFilterByCategory = true
        subject.searchItemFilterCategory = .airshipAftcastle
        subject.searchItemTradableOnly = true
        subject.searchItemUniqueOnly = true

        // Search
        subject.searchAscending = true
        subject.searchCaseSensitive = true // unused?
        subject.searchEquipmentOnly = false // unused?
        subject.searchExpansion = .dt // unused?
        subject.searchResultsLimit = 200
        subject.searchSortMethod = .alphabetical
        subject.searchType = .gathering

        // Shopping List
        subject.baseMaterials = true

        // User
        subject.userAscending = false
        subject.userSortMethod = .patch

        // Reset the settings
        subject.resetSettings()

        // These two settings are not reset
        XCTAssertEqual(subject.selectedTab, 1)
        XCTAssertEqual(subject.currentStoreName, "xivhelper-1.9.0")

        // All other settings are reset
        XCTAssertEqual(subject.locale, .en)
        XCTAssertEqual(subject.hq, true)
        XCTAssertEqual(subject.searchItemCraftableOnly, false)
        XCTAssertEqual(subject.searchItemFilterByCategory, false)
        XCTAssertEqual(subject.searchItemFilterCategory, .all)
        XCTAssertEqual(subject.searchItemTradableOnly, false)
        XCTAssertEqual(subject.searchItemUniqueOnly, false)
        XCTAssertEqual(subject.searchAscending, false)
        XCTAssertEqual(subject.searchCaseSensitive, false) // unused?
        XCTAssertEqual(subject.searchEquipmentOnly, false) // unused?
        XCTAssertEqual(subject.searchExpansion, .all) // unused?
        XCTAssertEqual(subject.searchResultsLimit, 100)
        XCTAssertEqual(subject.searchSortMethod, .ilvl)
        XCTAssertEqual(subject.searchType, .items)
        XCTAssertEqual(subject.baseMaterials, false)
        XCTAssertEqual(subject.userAscending, true)
        XCTAssertEqual(subject.userSortMethod, .alphabetical)
    }
}
