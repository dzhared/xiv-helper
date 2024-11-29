import XCTest

final class LodestoneNewsTests: XCTestCase {

    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var response: LodestoneNewsResponse!

    override func setUp() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        response = .empty
    }

    override func tearDown() {
        decoder = nil
        encoder = nil
        response = nil
    }

    /// A response encodes and decodes as expected.
    func testLodestoneNewsResponseEncodeDecode() throws {
        let response = LodestoneNewsResponse(
            topics: [.example],
            notices: [.example],
            maintenance: [.example],
            updates: [.example],
            status: [.example],
            developers: [.example]
        )
        let encoded = try encoder.encode(response)
        let decoded = try decoder.decode(LodestoneNewsResponse.self, from: encoded)
        XCTAssertEqual(decoded, response)
    }

    /// From a server response, the response is populated with all news types.
    func testLodestoneNewsResponseFromServer() throws {
        let bundle = Bundle(for: type(of: self))
        response = bundle.decode(
            LodestoneNewsResponse.self,
            from: "LodestoneNewsSampleResponse.json",
            dateDecodingStrategy: .iso8601
        )

        // Each type includes 20.
        XCTAssertEqual(response.developers.count, 20)
        XCTAssertEqual(response.maintenance.count, 20)
        XCTAssertEqual(response.notices.count, 20)
        XCTAssertEqual(response.status.count, 20)
        XCTAssertEqual(response.topics.count, 20)
        XCTAssertEqual(response.updates.count, 20)

        // A sample of each one matches the example as expected.
        let developer = try XCTUnwrap(response.developers.first)
        let maintenance = try XCTUnwrap(response.maintenance.first)
        let notice = try XCTUnwrap(response.notices.first)
        let status = try XCTUnwrap(response.status.first)
        let topic = try XCTUnwrap(response.topics.first)
        let updates = try XCTUnwrap(response.updates.first)

        XCTAssertEqual(developer, .example)
        XCTAssertEqual(maintenance, .example)
        XCTAssertEqual(notice, .example)
        XCTAssertEqual(status, .example)
        XCTAssertEqual(topic, .example)
        XCTAssertEqual(updates, .example)
    }
}
