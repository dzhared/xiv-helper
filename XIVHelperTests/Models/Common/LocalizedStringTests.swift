import XCTest

@testable import XIV_Helper

final class LocalizedStringTests: XCTestCase {

    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var localizedString: LocalizedString!
    var settings: SettingsManager!

    override func setUp() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        localizedString = LocalizedString.example
        settings = SettingsManager.shared
    }

    override func tearDown() {
        decoder = nil
        encoder = nil
        localizedString = nil
        settings.locale = .en // Otherwise, locale is left in Chinese, oops
        settings = nil
    }

    /// The raw values for codable conformance are as expected.
    func testLocalizedStringEncodeDecode() throws {
        let encoded = try encoder.encode(localizedString)
        let decoded = try decoder.decode(LocalizedString.self, from: encoded)
        XCTAssertEqual(decoded, localizedString)
    }
}
