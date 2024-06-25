import SnapshotTesting
import XCTest

@testable import XIV_Helper

final class UserRecipeViewTests: XCTestCase {

    var subject: UserRecipeView!

    override func setUp() {
        subject = UserRecipeView()
    }

    override func tearDown() {
        subject = nil
    }

    /// The view renders as expected.
    func testAppearance() {
        assertSnapshots(
            of: subject,
            as: [.image(layout: .device(config: .iPhone13ProMax))]
        )
    }
}
