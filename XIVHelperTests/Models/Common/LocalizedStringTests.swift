import XCTest

@testable import XIV_Helper

final class LocalizedStringTests: XCTestCase {

    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var localizedString: LocalizedString!
    var settings: SettingsManager!

    @MainActor override func setUp() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        localizedString = LocalizedString.example
        settings = SettingsManager.shared
    }

    @MainActor override func tearDown() {
        decoder = nil
        encoder = nil
        localizedString = nil
        settings.locale = .en // Otherwise, locale is left in Chinese, oops
        settings = nil
    }

    /// LocalizedString returns different languages depending on the locale in SettingsManager.
    @MainActor func testLocalizedStringChangesWithLocale() {
        /// English locale.
        settings.locale = .en
        XCTAssertEqual(localizedString.string, "Gil")

        /// Japanese locale.
        settings.locale = .ja
        XCTAssertEqual(localizedString.string, "ギル")

        /// German locale.
        settings.locale = .de
        XCTAssertEqual(localizedString.string, "Gil")

        /// French locale.
        settings.locale = .fr
        XCTAssertEqual(localizedString.string, "Gil")

        /// Korean locale.
        settings.locale = .ko
        XCTAssertEqual(localizedString.string, "길")

        /// Chinese locale.
        settings.locale = .zh
        XCTAssertEqual(localizedString.string, "金币")
    }

    /// The raw values for codable conformance are as expected.
    func testLocalizedStringEncodeDecode() throws {
        let encoded = try encoder.encode(localizedString)
        let decoded = try decoder.decode(LocalizedString.self, from: encoded)
        XCTAssertEqual(decoded, localizedString)
    }
}
