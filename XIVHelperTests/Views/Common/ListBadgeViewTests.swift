import SnapshotTesting
import XCTest

@testable import XIV_Helper

final class ListBadgeViewTests: XCTestCase {

    var subject: ListBadgeView!

    override func setUp() {
        subject = ListBadgeView(recipe: .example)
    }

    override func tearDown() {
        subject = nil
    }

    /// The view renders as expected.
    func testAppearance() {
        assertSnapshot(view: subject, testBundleResourceURL: Bundle(for: type(of: self)).resourceURL!)
    }
}
