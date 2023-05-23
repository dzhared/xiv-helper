//
//  Search.swift
//  xiv-turnins
//
//  Created by Jared on 4/8/23.
//

import SwiftUI

struct Response: Codable {
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case results = "Results"
    }
}

struct Result: Codable {
    let id: Int
    let icon: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case icon = "Icon"
        case name = "Name"
    }
}

enum QueryType: String {
    case recipe = "Recipe"
    case leve = "Leve"
}

func searchItems(for query: String, queryType: QueryType, completion: @escaping ([Result]) -> Void) {
    let baseURL = "https://xivapi.com"
    let encodedItemName = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let url = URL(string: "\(baseURL)/search?string=\(encodedItemName)&indexes=\(queryType.rawValue)&limit=10&fuzzy=true&columns=ID,Icon,Name")!
    
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"
    
    let session = URLSession.shared
    
    let task = session.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error in API call: \(error.localizedDescription)")
            completion([])
            return
        }
        
        guard let data = data else {
            print("Error retrieving data.")
            completion([])
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(Response.self, from: data)
            if !response.results.isEmpty {
                completion(response.results)
            } else {
                completion([])
                return
            }
        } catch {
            print("Error decoding data: \(error.localizedDescription)")
            completion([])
            return
        }
    }
    task.resume()
}
