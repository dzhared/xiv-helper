import XCTest
@testable import xiv_turnins

// MARK: LodestoneNewsViewTests

final class LodestoneNewsViewTests: XCTestCase {
    
    /// The JSON is correctly decoded from the API call.
    func testDecodingLodestoneNews() throws {
        let sampleJSON = """
        {
            "id": "0bb6b9ddf074dcf3738acddd4391b9d9b3b0c54c",
            "url": "https://na.finalfantasyxiv.com/lodestone/topics/detail/0bb6b9ddf074dcf3738acddd4391b9d9b3b0c54c",
            "title": "Letter from the Producer LIVE Part LXIV Digest Released",
            "time": "2021-05-27T08:00:00Z",
            "image": "https://img.finalfantasyxiv.com/t/0bb6b9ddf074dcf3738acddd4391b9d9b3b0c54c.png?1622102284",
            "description": "We’re pleased to announce that the Letter from the Producer LIVE Part LXIV event digest has been released!\\n\\nIf you weren’t able to watch the live stream, or if you just want to watch it again, be sure to check it out!\\n\\nProceed to the thread."
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime]
        
        let article = try decoder.decode(LodestoneNews.self, from: sampleJSON)
        
        XCTAssertEqual(article.id, "0bb6b9ddf074dcf3738acddd4391b9d9b3b0c54c")
        XCTAssertEqual(article.formattedURL, URL(string: "https://na.finalfantasyxiv.com/lodestone/topics/detail/0bb6b9ddf074dcf3738acddd4391b9d9b3b0c54c")!)
        XCTAssertEqual(article.title, "Letter from the Producer LIVE Part LXIV Digest Released")
        XCTAssertEqual(article.image, "https://img.finalfantasyxiv.com/t/0bb6b9ddf074dcf3738acddd4391b9d9b3b0c54c.png?1622102284")
        XCTAssertEqual(article.description, "We’re pleased to announce that the Letter from the Producer LIVE Part LXIV event digest has been released!\n\nIf you weren’t able to watch the live stream, or if you just want to watch it again, be sure to check it out!\n\nProceed to the thread.")
        XCTAssertEqual(article.formattedTime, "May 27, 2021")
    }
    
}
