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

    /// Patch `96`, the future first patch of Dawntrail, has not yet been added.
    /// This patch should fail when that patch is released.
    func testPatchDawntrailPatchNotReleased() {
        let futurePatch = Patch(id: 96)
        XCTAssertEqual(futurePatch.id, 2)
    }

    /// The `Patch` encodes and decodes as expected.
    func testPatchEncodeDecode() throws {
        let encoded = try encoder.encode(patch)
        let decoded = try decoder.decode(Patch.self, from: encoded)
        XCTAssertEqual(decoded, patch)
    }

    /// Patch `release` values increment sequentially. Necessary for sorting.
    func testPatchReleaseSequentially() {
        for n in 1..<93 {
            let earlierPatch = Patch(id: n)
            let laterPatch = Patch(id: n + 1)

            /// Skip any missing patches, which default to `id` of `2`.
            if earlierPatch.id == 2 || laterPatch.id == 2 {
                continue
            }

            /// The earlier patch has a lesser or equal `release` than the subsequent patch.
            XCTAssertLessThanOrEqual(earlierPatch.release, laterPatch.release)
        }
    }
}
