import XCTest

@testable import XIV_Helper

final class PatchTests: XCTestCase {

    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var patch: Patch!

    override func setUp() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        patch = Patch(id: 45)
    }

    override func tearDown() {
        decoder = nil
        encoder = nil
        patch = nil
    }

    /// The Patch encodes and decodes as expected.
    func testPatchEncodeDecode() throws {
        let encoded = try encoder.encode(patch)
        let decoded = try decoder.decode(Patch.self, from: encoded)
        XCTAssertEqual(decoded, patch)
    }

    // TODO
}
