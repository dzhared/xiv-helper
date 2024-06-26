import SnapshotTesting
import XCTest

@testable import XIV_Helper

final class ItemTitleBadgeViewTests: XCTestCase {

    var subject: ItemTitleBadgeView!

    override func setUp() {
        subject = ItemTitleBadgeView(
            icon: URL(string: "https://xivapi.com/i/030000/030670_hr1.png")!,
            ilvl: 665,
            itemCategoryId: 2,
            name: LocalizedString(en: "Mandervillous Falchion"),
            classJobCategory: ClassJobCategory(id: 20),
            patch: Patch(id: 93)
        )
    }

    override func tearDown() {
        subject = nil
    }

    /// The view renders as expected.
    func testAppearance() {
        assertSnapshot(view: subject, testBundleResourceURL: Bundle(for: type(of: self)).resourceURL!)
    }
}
