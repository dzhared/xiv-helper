import SnapshotTesting
import XCTest

@testable import XIV_Helper

final class ItemNodesViewTests: XCTestCase {

    var subject: ItemNodesView!

    override func setUp() {
        subject = ItemNodesView(nodes: [.example, .example, .example])
    }

    override func tearDown() {
        subject = nil
    }

    /// The view renders as expected.
    func testAppearance() {
        assertSnapshot(view: subject, testBundleResourceURL: Bundle(for: type(of: self)).resourceURL!)
    }
}
