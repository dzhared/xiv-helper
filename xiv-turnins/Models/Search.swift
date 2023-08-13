import Foundation

// MARK: - Response

struct Response: Codable {
    let results: [Result]
}

// MARK: - Result

struct Result: Codable {
    let id: Int
    let icon: String
    let name: String
}

// MARK: - QueryType

enum QueryType: String {
    case recipe = "Recipe"
    case leve = "Leve"
}

// MARK: - Functions

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
