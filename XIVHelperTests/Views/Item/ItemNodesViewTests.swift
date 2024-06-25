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
        assertSnapshots(of: subject, as: [.image])
    }
}
