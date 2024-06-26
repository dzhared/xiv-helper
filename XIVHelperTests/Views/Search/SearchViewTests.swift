import SnapshotTesting
import XCTest

@testable import XIV_Helper

final class SearchViewTests: XCTestCase {

    var subject: SearchView!

    override func setUp() {
        subject = SearchView()
    }

    override func tearDown() {
        subject = nil
    }

    /// The view renders as expected.
    func testSearchViewAppearance() {
        assertSnapshot(view: subject, testBundleResourceURL: Bundle(for: type(of: self)).resourceURL!)
    }
}
