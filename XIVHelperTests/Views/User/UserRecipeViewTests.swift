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
    func testUserRecipeViewAppearance() {
        assertSnapshot(view: subject, testBundleResourceURL: Bundle(for: type(of: self)).resourceURL!)
    }
}
