import SwiftUI

// MARK: - Recipe

struct Recipe {
    let amountIngredient0: Int
    let amountIngredient1: Int
    let amountIngredient2: Int
    let amountIngredient3: Int
    let amountIngredient4: Int
    let amountIngredient5: Int
    let amountIngredient6: Int
    let amountIngredient7: Int
    let amountIngredient8: Int
    let amountIngredient9: Int
    
    let itemIngredient0: ItemIngredient
    let itemIngredient1: ItemIngredient
    let itemIngredient2: ItemIngredient
    let itemIngredient3: ItemIngredient
    let itemIngredient4: ItemIngredient
    let itemIngredient5: ItemIngredient
    let itemIngredient6: ItemIngredient
    let itemIngredient7: ItemIngredient
    let itemIngredient8: ItemIngredient
    let itemIngredient9: ItemIngredient
    
    let recipeLevelTable: [String: Int]
    var difficulty: Int {
        recipeLevelTable["Difficulty"] ?? 0
    }
    var durability: Int {
        recipeLevelTable["Durability"] ?? 0
    }
    var suggestedControl: Int {
        recipeLevelTable["SuggestedControl"] ?? 0
    }
    var suggestedCraftsmanship: Int {
        recipeLevelTable["SuggestedCraftsmanship"] ?? 0
    }
    
    var ingredients: [Ingredient] {
        var ingredients = [Ingredient]()
        
        if amountIngredient0 > 0 {
            ingredients.append(Ingredient(
                icon: itemIngredient0.icon,
                name: itemIngredient0.name,
                quantity: amountIngredient0,
                identifier: 0))
        }
        if amountIngredient1 > 0 {
            ingredients.append(Ingredient(
                icon: itemIngredient1.icon,
                name: itemIngredient1.name,
                quantity: amountIngredient1,
                identifier: 1))
        }
        if amountIngredient2 > 0 {
            ingredients.append(Ingredient(
                icon: itemIngredient2.icon,
                name: itemIngredient2.name,
                quantity: amountIngredient2,
                identifier: 2))
        }
        if amountIngredient3 > 0 {
            ingredients.append(Ingredient(
                icon: itemIngredient3.icon,
                name: itemIngredient3.name,
                quantity: amountIngredient3,
                identifier: 3))
        }
        if amountIngredient4 > 0 {
            ingredients.append(Ingredient(
                icon: itemIngredient4.icon,
                name: itemIngredient4.name,
                quantity: amountIngredient4,
                identifier: 4))
        }
        if amountIngredient5 > 0 {
            ingredients.append(Ingredient(
                icon: itemIngredient5.icon,
                name: itemIngredient5.name,
                quantity: amountIngredient5,
                identifier: 5))
        }
        if amountIngredient6 > 0 {
            ingredients.append(Ingredient(
                icon: itemIngredient6.icon,
                name: itemIngredient6.name,
                quantity: amountIngredient6,
                identifier: 6))
        }
        if amountIngredient7 > 0 {
            ingredients.append(Ingredient(
                icon: itemIngredient7.icon,
                name: itemIngredient7.name,
                quantity: amountIngredient7,
                identifier: 7))
        }
        if amountIngredient8 > 0 {
            ingredients.append(Ingredient(
                icon: itemIngredient8.icon,
                name: itemIngredient8.name,
                quantity: amountIngredient8,
                identifier: 8))
        }
        if amountIngredient9 > 0 {
            ingredients.append(Ingredient(
                icon: itemIngredient9.icon,
                name: itemIngredient9.name,
                quantity: amountIngredient9,
                identifier: 9))
        }
        
        return ingredients
    }
}

// MARK: Codable

extension Recipe: Codable {
    enum CodingKeys: String, CodingKey {
        case amountIngredient0 = "AmountIngredient0"
        case amountIngredient1 = "AmountIngredient1"
        case amountIngredient2 = "AmountIngredient2"
        case amountIngredient3 = "AmountIngredient3"
        case amountIngredient4 = "AmountIngredient4"
        case amountIngredient5 = "AmountIngredient5"
        case amountIngredient6 = "AmountIngredient6"
        case amountIngredient7 = "AmountIngredient7"
        case amountIngredient8 = "AmountIngredient8"
        case amountIngredient9 = "AmountIngredient9"
        
        case itemIngredient0 = "ItemIngredient0"
        case itemIngredient1 = "ItemIngredient1"
        case itemIngredient2 = "ItemIngredient2"
        case itemIngredient3 = "ItemIngredient3"
        case itemIngredient4 = "ItemIngredient4"
        case itemIngredient5 = "ItemIngredient5"
        case itemIngredient6 = "ItemIngredient6"
        case itemIngredient7 = "ItemIngredient7"
        case itemIngredient8 = "ItemIngredient8"
        case itemIngredient9 = "ItemIngredient9"
        
        case recipeLevelTable = "RecipeLevelTable"
    }
}

// MARK: Example

extension Recipe {
    /// An example `Recipe` to use for testing and previews.
    static let example: Recipe = Recipe(
        amountIngredient0: 1,
        amountIngredient1: 2,
        amountIngredient2: 1,
        amountIngredient3: 0,
        amountIngredient4: 0,
        amountIngredient5: 0,
        amountIngredient6: 0,
        amountIngredient7: 0,
        amountIngredient8: 7,
        amountIngredient9: 7,
        itemIngredient0: ItemIngredient(wrappedIcon: "27835", wrappedName: "Lemonette"),
        itemIngredient1: ItemIngredient(wrappedIcon: "27835", wrappedName: "Lemonette"),
        itemIngredient2: ItemIngredient(wrappedIcon: "27835", wrappedName: "Lemonette"),
        itemIngredient3: ItemIngredient(wrappedIcon: "27835", wrappedName: "Lemonette"),
        itemIngredient4: ItemIngredient(wrappedIcon: "27835", wrappedName: "Lemonette"),
        itemIngredient5: ItemIngredient(wrappedIcon: "27835", wrappedName: "Lemonette"),
        itemIngredient6: ItemIngredient(wrappedIcon: "27835", wrappedName: "Lemonette"),
        itemIngredient7: ItemIngredient(wrappedIcon: "27835", wrappedName: "Lemonette"),
        itemIngredient8: ItemIngredient(wrappedIcon: "27835", wrappedName: "Lemonette"),
        itemIngredient9: ItemIngredient(wrappedIcon: "27835", wrappedName: "Lemonette"),
        recipeLevelTable: [
            "ClassJobLevel": 74,
            "ConditionsFlag": 15,
            "Difficulty": 1360,
            "Durability": 80,
            "ID": 403,
            "ProgressDivider": 104,
            "ProgressModifier": 100,
            "Quality": 4000,
            "QualityDivider": 84,
            "QualityModifier": 100,
            "Stars": 0,
            "SuggestedControl": 1387,
            "SuggestedCraftsmanship": 1498
        ]
    )
}

// MARK: - ItemIngredient

extension Recipe {
    /// Ingredients specifically for use in a `Recipe`.
    struct ItemIngredient: Codable {
        let wrappedIcon: String?
        let wrappedName: String?
        
        var icon: String {
            wrappedIcon ?? "/i/000000/000033_hr1.png"
        }
        var name: String {
            wrappedName ?? "Unknown Item"
        }
        
        enum CodingKeys: String, CodingKey {
            case wrappedIcon = "IconHD"
            case wrappedName = "Name"
        }
    }
}

// MARK: - Ingredient

/// The type and quantity of an ingredient.
struct Ingredient {
    let icon: String
    let name: String
    let quantity: Int
    let identifier: Int
}

extension Ingredient: Identifiable {
    var id: Int {
        identifier
    }
}

// MARK: - Functions

func getRecipe(recipeID: Int, completion: @escaping (Recipe?) -> Void) {
    let url: URL = URL(string: "https://xivapi.com/recipe/\(recipeID)?columns=RecipeLevelTable.Difficulty,RecipeLevelTable.Durability,RecipeLevelTable.SuggestedControl,RecipeLevelTable.SuggestedCraftsmanship,AmountIngredient0,ItemIngredient0.IconHD,ItemIngredient0.Name,AmountIngredient1,ItemIngredient1.IconHD,ItemIngredient1.Name,AmountIngredient2,ItemIngredient2.IconHD,ItemIngredient2.Name,AmountIngredient3,ItemIngredient3.IconHD,ItemIngredient3.Name,AmountIngredient4,ItemIngredient4.IconHD,ItemIngredient4.Name,AmountIngredient5,ItemIngredient5.IconHD,ItemIngredient5.Name,AmountIngredient6,ItemIngredient6.IconHD,ItemIngredient6.Name,AmountIngredient7,ItemIngredient7.IconHD,ItemIngredient7.Name,AmountIngredient8,ItemIngredient8.IconHD,ItemIngredient8.Name,AmountIngredient9,ItemIngredient9.IconHD,ItemIngredient9.Name")!
    
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"
    
    let session = URLSession.shared
    
    let task = session.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print("Error while retrieving: \(error.localizedDescription)")
            completion(nil)
            return
        }
        
        guard let data = data else {
            print("Unable to retrieve data.")
            completion(nil)
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let recipe = try decoder.decode(Recipe.self, from: data)
            completion(recipe)
        } catch {
            print("Error while decoding in getRecipe: \(error.localizedDescription)")
            completion(nil)
        }
    }
    task.resume()
}
