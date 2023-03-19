//
//  Deliverable.swift
//  xiv-turnins
//
//  Created by Jared on 3/13/23.
//

import SwiftUI

class Deliverable: ObservableObject, Identifiable {
    @Published var name: String
    @Published var id: Int
    @Published var icon: String
    @Published var recipe: Int
    
    var recipeURL: String {
        "https://ffxivteamcraft.com/db/en/item/\(id)/\(name.replacingOccurrences(of: " ", with: "-"))"
    }
    
    init(name: String, id: Int, icon: String, recipe: Int) {
        self.name = name
        self.id = id
        self.icon = icon
        self.recipe = recipe
    }
    
    var identifier: Int {
        return id
    }
}

func getDeliverable(itemName: String, completion: @escaping (Deliverable?) -> Void) {
    let baseURL = "https://xivapi.com"
    let encodedItemName = itemName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let url = URL(string: "\(baseURL)/search?string=\(encodedItemName)&string_algo=match")!
    
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"
    
    let session = URLSession.shared
    
    let task = session.dataTask(with: request) { (data, response, error) in
        guard let data = data, error == nil else {
            if let error = error {
                print("Error in API call: \(error.localizedDescription).")
            } else {
                print("Error in API call.")
            }
            completion(nil)
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//            print(json) // Uncomment for debugging
            if let results = json["Results"] as? [[String: Any]],
               let itemID = results[0]["ID"] as? Int,
               let itemName = results[0]["Name"] as? String,
               let itemIcon = results[0]["Icon"] as? String,
               let itemRecipe = results[1]["ID"] as? Int
            {
                let deliverable = Deliverable(name: itemName, id: itemID, icon: itemIcon, recipe: itemRecipe)
                print("Successfully created deliverable for \(itemName).")
                completion(deliverable)
            } else {
                completion(nil)
            }
        } catch {
            print("Error decoding data: \(error.localizedDescription)")
            completion(nil)
            return
        }
    }
    print("Starting data task for \(itemName).")
    task.resume()
}
