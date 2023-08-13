// MARK: - ItemRecipeInfo

struct ItemRecipeInfo {
    let classJobID, id, level: Int
}

// MARK: Codable

extension ItemRecipeInfo: Codable {
    enum CodingKeys: String, CodingKey {
        case classJobID = "ClassJobID"
        case id = "ID"
        case level = "Level"
    }
}
