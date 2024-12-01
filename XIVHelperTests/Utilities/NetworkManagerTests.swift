import XCTest

@testable import XIV_Helper

final class NetworkManagerTests: XCTestCase {

    var subject: NetworkManager!

    override func setUp() {
        super.setUp()
        subject = NetworkManager.shared
    }

    override func tearDown() {
        super.tearDown()
        subject = nil
    }

    /// Test the network manager. Will fail if no connection is available.
    func testNetworkManager() async throws {
        let _ = try await subject.fetch(
            url: URL(string: "https://lodestonenews.com/news/all")!,
            httpMethod: .get,
            responseType: LodestoneNewsResponse.self
        )
    }
}
