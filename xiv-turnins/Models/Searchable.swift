import Foundation

protocol Searchable: Codable, Equatable, Identifiable {
    var icon: String { get }
    var id: Int { get }
    var name: String { get }
}
