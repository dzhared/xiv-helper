import Foundation

// MARK: - Leve

struct Leve: Searchable {
    
    // MARK: Properties
    
    let allowanceCost: Int
    let classJobCategory: ClassJobCategory
    let classJobLevel: Int
    let description: String
    let expFactor: Int
    let expReward: Int
    let id: Int
    let leveClient: LeveClient
    let name: String
    let town: Town
    
    var icon: String {
        town.iconHd
    }
    
    var iconURL: URL {
        URL(string: "https://xivapi.com\(town.iconHd)")!
    }
    
    // MARK: Example
    
    static let example: Leve = Leve(
        allowanceCost: 1,
        classJobCategory: ClassJobCategory.example,
        classJobLevel: 30,
        description: "There is no better customer than an elderly Ul'dahn. Forget what you've heard about the wonders of the afterlife, these well-to-dos seek only to extend their stay in Nald's realm that they might revel in its pleasures. For them, possession is power, money is never an object, and senility sees that they keep coming back for more. Take, for example, Wanderer's Blood. As useless as snake oil, and twice as foul, but its rarity has transformed it into a must-have item here in Costa del Sol. And when there is demand, it is only natural to provide a supply. If you are willing to assist my establishment in gathering the Oschon roselle calyces needed to give the tincture its color, I would be more than happy to give you a cut of my profits.",
        expFactor: 101,
        expReward: 0,
        id: 700,
        leveClient: LeveClient.example,
        name: "Bleeding Them Dry",
        town: Town.example)
}

// MARK: Equatable

extension Leve: Equatable {
    static func == (lhs: Leve, rhs: Leve) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: Codable

extension Leve: Codable {
    enum CodingKeys: String, CodingKey {
        case allowanceCost = "AllowanceCost"
        case classJobCategory = "ClassJobCategory"
        case classJobLevel = "ClassJobLevel"
        case description = "Description"
        case expFactor = "ExpFactor"
        case expReward = "ExpReward"
        case id = "ID"
        case leveClient = "LeveClient"
        case name = "Name"
        case town = "Town"
    }
}

// MARK: - LeveClient

struct LeveClient: Codable {
    
    // MARK: Properties
    
    let id: Int
    let name: String
    
    // MARK: Example
    
    static let example: LeveClient = LeveClient(id: 65, name: "Client: Flying Shark Proprietor, Dyrstweitz the Daft")
    
    // MARK: Codable
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
    }
}

func getLeveFromString(string: String, completion: @escaping (Leve?) -> Void) {
    getLeveIDFromName(leveName: string) { leveID in
        if let leveID = leveID {
            getLeveFromID(itemID: leveID) { retrievedLeve in
                completion(retrievedLeve)
            }
            completion(nil)
        } else {
            completion(nil)
        }
    }
}

func getLeveIDFromName(leveName: String, completion: @escaping (Int?) -> Void) {
    let baseURL = "https://xivapi.com"
    let encodedLeveName = leveName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let url = URL(string: "\(baseURL)/search?string=\(encodedLeveName)&string_algo=match&columns=ID&limit=1")!
    
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
            let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
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

func getLeveFromID(itemID: Int, completion: @escaping (Leve?) -> Void) {
    let url = URL(string: "https://xivapi.com/leve/\(itemID)?columns=AllowanceCost,ClassJobCategory,ClassJobLevel,Description,ExpFactor,ExpReward,ID,LeveClient,Name,Town")!
    
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
            let decoder = JSONDecoder()
            let leve = try decoder.decode(Leve.self, from: data)
            completion(leve)
        } catch {
            print("Error while decoding in getLeveFromID for \(response.debugDescription): \(error.localizedDescription)")
            completion(nil)
        }
    }
    task.resume()
}
