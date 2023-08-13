import Foundation

// MARK: - Town

struct Town: Codable, Identifiable {
    
    // MARK: Properties
    
    let id: Int
    let iconHd: String
    let name: String
    
    // MARK: Example
    
    static let example: Town = Town(
        id: 1,
        iconHd: "/i/060000/060881_hr1.png",
        name: "Limsa Lominsa"
    )
}
