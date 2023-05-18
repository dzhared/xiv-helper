//
//  Item.swift
//  xiv-turnins
//
//  Created by Jared on 3/13/23.
//

// TODO: Refactor, clean up

import SwiftUI

struct Item: Codable, Identifiable, Equatable {
    let classJobCategory: ClassJobCategory
    let id: Int
    let icon: String
    let levelEquip, levelItem: Int
    let name: String
    let itemRecipeInfo: [ItemRecipeInfo]
    
    var classJob: (String, String) {
        getJobAcronym(id: itemRecipeInfo[0].classJobID)
    }
    
    var identifier: Int {
        return id
    }
    
    enum CodingKeys: String, CodingKey {
        case classJobCategory = "ClassJobCategory"
        case id = "ID"
        case icon = "IconHD"
        case levelEquip = "LevelEquip"
        case levelItem = "LevelItem"
        case name = "Name"
        case itemRecipeInfo = "Recipes"
    }
    
    struct ClassJobCategory: Codable {
        let equipClass: String?
        
        enum CodingKeys: String, CodingKey {
            case equipClass = "Name"
        }
    }
    
    struct ItemRecipeInfo: Codable {
        let classJobID, id, level: Int
        
        enum CodingKeys: String, CodingKey {
            case classJobID = "ClassJobID"
            case id = "ID"
            case level = "Level"
        }
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }
    
    static let example = Item(classJobCategory: Item.ClassJobCategory(equipClass: "All Classes"), id: 2747, icon: "/i/046000/046540_hr1.png", levelEquip: 53, levelItem: 80, name: "Holy Rainbow Shoes", itemRecipeInfo: [Item.ItemRecipeInfo(classJobID: 13, id: 2747, level: 54)])
}

func getItemFromString(_ string: String, completion: @escaping (Item?) -> Void) {
    getItemIDFromName(itemName: string) { itemID in
        if let itemID = itemID {
            getItemFromID(itemID: itemID) { retrievedItem in
                completion(retrievedItem)
            }
        } else {
            completion(nil)
        }
    }
}

func getItemIDFromName(itemName: String, completion: @escaping (Int?) -> Void) {
    let baseURL = "https://xivapi.com"
    let encodedItemName = itemName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let url = URL(string: "\(baseURL)/search?string=\(encodedItemName)&string_algo=match&columns=ID&limit=1")!
    
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"
    
    let session = URLSession.shared
    
    let task = session.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error in API call: \(error.localizedDescription)")
            completion(nil)
            return
        }
        
        guard let data = data else {
            print("Error retrieving data.")
            completion(nil)
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            if let results = json["Results"] as? [[String: Any]], let itemID = results[0]["ID"] as? Int {
                completion(itemID)
            } else {
                completion(nil)
            }
        } catch {
            print("Error decoding data: \(error.localizedDescription)")
            completion(nil)
            return
        }
    }
    task.resume()
}

func getItemFromID(itemID: Int, completion: @escaping (Item?) -> Void) {
    let url = URL(string: "https://xivapi.com/item/\(itemID)?columns=Name,LevelEquip,LevelItem,Recipes,IconHD,ClassJobCategory.Name,ID")!
    
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"
    
    let session = URLSession.shared
    
    let task = session.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print("Error in API call: \(error.localizedDescription)")
            completion(nil)
            return
        }
        
        guard let data = data else {
            print("Error retrieving data.")
            completion(nil)
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let item = try decoder.decode(Item.self, from: data)
            completion(item)
        } catch {
            print("Error while decoding in getItemFromID for \(response.debugDescription): \(error.localizedDescription)")
            completion(nil)
        }
    }
    task.resume()
}
