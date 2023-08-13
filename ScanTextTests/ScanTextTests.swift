import XCTest
@testable import xiv_turnins

// MARK: - ScanTextTests

final class ScanTextTests: XCTestCase {
    
    func testMatchTruncatedString() throws {
        let expectedStrings: [String: String] = [
            "Dwarven Mythril Chainmail of Mai...": "Dwarven Mythril Chainmail of Maiming",
            "AR-Caean Velvet Culottes of Gathe...": "AR-Caean Velvet Culottes of Gathering",
            "AR-Caean Velvet Work Cap of Cra...": "AR-Caean Velvet Work Cap of Crafting",
            "Dwarven Cotton Gaskins of Scou...": "Dwarven Cotton Gaskins of Scouting"
        ]
        
        for (key, value) in expectedStrings {
            print("Key: \(key), Value: \(value)")
            XCTAssertEqual(matchTruncatedString(key), value)
        }
    }
    
    func testSampleImage() throws {
        let testImage = UIImage(named: "exampleImageTruncatedText")!
        let testText = scanText(image: testImage)
        print(testText.0)
        print(testText.1)
        
        XCTAssertTrue(!testText.1.isEmpty, "Failed to extract the following items: \(testText.1)")
    }
    
    func testRemovingCharacters() throws {
        // Simulate potential unusual text inputs
        let testInputs: [String] = [
            "Red Pine Cane",
            "* * Chondrite Cross-pein Hammer",
            "& Dwarven Mythril Chainmail of Maiming",
            "Ametrine Bracelet of Healing",
            "# Swallowskin Gloves of Healing",
            "AR-Caean Velvet Work Cap of Crafting",
            "Tincture of Strength",
            "• Sykon Bavarois"
        ]
        
        // Check if filtered strings are present in allItems array
        let filteredTestInputs = filterLines(unfilteredLines: testInputs)
        
        XCTAssertTrue(filteredTestInputs.1.isEmpty, "Failed to find items in allItems array: \(filteredTestInputs.1)")
    }
}
