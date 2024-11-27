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

    /// Patch `100`, the patch after 7.11, has not yet been added. This patch should fail when that
    /// patch is released.
    func testFuturePatchNotReleased() {
        // The current patch returns the expected attributes.
        patch = Patch(id: 99)
        XCTAssertEqual(
            patch,
            Patch(
                id: 99,
                banner: "None",
                ex: true,
                release: 1732606637,
                en: "Patch 7.11",
                de: "Patch 7.11",
                ja: "Patch 7.11",
                fr: "Patch 7.11",
                ko: "Patch 7.11",
                zh: "Patch 7.11",
                version: "7.11"
            )
        )

        // The following patch does not exist.
        patch = Patch(id: 100)
        XCTAssertEqual(patch.id, 2)
    }

    /// The `Patch` encodes and decodes as expected.
    func testPatchEncodeDecode() throws {
        let encoded = try encoder.encode(patch)
        let decoded = try decoder.decode(Patch.self, from: encoded)
        XCTAssertEqual(decoded, patch)
    }

    /// Patch `release` values increment sequentially. Necessary for sorting.
    func testPatchReleaseSequentially() {
        for n in 1..<100 {
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
