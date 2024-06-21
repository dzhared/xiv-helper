import XCTest

@testable import XIV_Helper

final class StatTests: XCTestCase {

    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var stat: Stat!

    override func setUp() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        stat = Stat(id: 1, nq: 2, hq: 3)
    }

    override func tearDown() {
        decoder = nil
        encoder = nil
        stat = nil
    }

    /// The computed properties initialize correctly.
    func testStatComputedProperties() {
        /// The `BaseParam` initializes correctly.
        XCTAssertEqual(stat.baseParam, BaseParam(id: stat.id))
    }

    /// The Stat encodes and decodes as expected.
    func testStatEncodeDecode() throws {
        let encoded = try encoder.encode(stat)
        let decoded = try decoder.decode(Stat.self, from: encoded)
        XCTAssertEqual(decoded, stat)
    }
}
