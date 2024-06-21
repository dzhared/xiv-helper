import XCTest

@testable import XIV_Helper

final class LodestoneNewsArticleTests: XCTestCase {

    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var article: LodestoneNewsArticle!

    override func setUp() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        article = .example
    }

    override func tearDown() {
        decoder = nil
        encoder = nil
        article = nil
    }

    /// The LodestoneNewsArticle encodes and decodes as expected.
    func testLodestoneNewsArticleEncodeDecode() throws {
        let encoded = try encoder.encode(article)
        let decoded = try decoder.decode(LodestoneNewsArticle.self, from: encoded)
        XCTAssertEqual(decoded, article)
    }
}
