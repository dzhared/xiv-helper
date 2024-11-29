import Foundation

/// A decodable response to simplify the decoding the server response.
struct LodestoneNewsResponse: Codable, Equatable {
    let topics: [LodestoneNewsTopic]
    let notices: [LodestoneNewsNotice]
    let maintenance: [LodestoneNewsMaintenance]
    let updates: [LodestoneNewsUpdate]
    let status: [LodestoneNewsStatus]
    let developers: [LodestoneNewsDeveloper]

    /// A static example to return an empty response.
    static let empty = LodestoneNewsResponse(
        topics: [],
        notices: [],
        maintenance: [],
        updates: [],
        status: [],
        developers: []
    )
}
