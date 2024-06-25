import SnapshotTesting
import XCTest

@testable import XIV_Helper

final class ParameterGridViewTests: XCTestCase {

    var subject: ParameterGridView!

    override func setUp() {
        subject = ParameterGridView(recipe: .example)
    }

    override func tearDown() {
        subject = nil
    }

    /// The view renders as expected.
    func testAppearance() {
        assertSnapshots(of: subject, as: [.image])
    }
}
