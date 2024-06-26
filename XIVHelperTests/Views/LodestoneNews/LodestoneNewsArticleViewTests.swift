import SnapshotTesting
import XCTest

@testable import XIV_Helper

final class LodestoneNewsArticleViewTests: XCTestCase {

    var subject: LodestoneNewsArticleView!

    override func setUp() {
        subject = LodestoneNewsArticleView(article: .example)
    }

    override func tearDown() {
        subject = nil
    }

    /// The view renders as expected.
    func testLodestoneNewsArticleViewAppearance() {
        assertSnapshot(view: subject, testBundleResourceURL: Bundle(for: type(of: self)).resourceURL!)
    }
}
