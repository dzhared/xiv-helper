import XCTest
import SwiftData

@testable import XIV_Helper

final class UserRecipeTests: XCTestCase {

    var container: ModelContainer!
    var decoder: JSONDecoder!
    var encoder: JSONEncoder!
    var userRecipe: UserRecipe!

    override func setUp() {
        container = previewContainer
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        userRecipe = UserRecipe(recipe: .example, quantity: 1)
    }

    override func tearDown() {
        container = nil
        decoder = nil
        encoder = nil
        userRecipe = nil
    }

    /// The `UserRecipe` inserts and fetches from the model context as expected.
    /// It cannot be encoded/decoded because of the `@Attribute(.unique)` wrapper on `recipe`.
    @MainActor func testUserRecipeFetch() throws {
        container.mainContext.insert(userRecipe)
        let retrieved = try container.mainContext.fetch(FetchDescriptor<UserRecipe>())
        XCTAssertEqual(retrieved.first, userRecipe)
    }
}
