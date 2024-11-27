import XCTest

@testable import XIV_Helper

final class LeveTests: XCTestCase {

    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var leve: Leve!

    override func setUp() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        leve = Leve(
            leve: 5,
            amount: 3,
            lvl: 50,
            name: LocalizedString(en: "Leve EN", ja: "Leve JA", de: "Leve DE", fr: "Leve FR"),
            classJob: 23
        )
    }

    override func tearDown() {
        decoder = nil
        encoder = nil
        leve = nil
    }

    /// The raw values for codable conformance are as expected.
    func testLeveEncodeDecode() throws {
        let encoded = try encoder.encode(leve)
        let decoded = try decoder.decode(Leve.self, from: encoded)
        XCTAssertEqual(decoded, leve)
    }
}
