import XCTest

@testable import XIV_Helper

final class NodeTests: XCTestCase {

    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var node: Node!

    override func setUp() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        node = .example
    }

    override func tearDown() {
        decoder = nil
        encoder = nil
        node = nil
    }

    /// The computed properties initialize correctly.
    func testNodeComputedProperties() {
        // TODO
    }

    /// The Stat encodes and decodes as expected.
    func testNodeEncodeDecode() throws {
        let encoded = try encoder.encode(node)
        let decoded = try decoder.decode(Node.self, from: encoded)
        XCTAssertEqual(decoded, node)
    }
}
