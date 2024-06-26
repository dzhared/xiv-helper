import SnapshotTesting
import XCTest

@testable import XIV_Helper

final class InfoViewTests: XCTestCase {

    var subject: InfoView!

    override func setUp() {
        subject = InfoView()
    }

    override func tearDown() {
        subject = nil
    }

    /// The view renders as expected.
    func testAppearance() {
        assertSnapshot(view: subject, testBundleResourceURL: Bundle(for: type(of: self)).resourceURL!)
    }
}
