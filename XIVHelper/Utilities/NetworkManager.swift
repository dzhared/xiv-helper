import Foundation

/// A shared network manager used to perform network calls throughout the app.
final class NetworkManager {

    // MARK: Initialization

    /// The shared instance of `NetworkManager`.
    nonisolated(unsafe) static let shared = NetworkManager()

    /// The `URLSession` used by the manager.
    private let session: URLSession

    /// Do not initialize the class.
    private init(session: URLSession = .shared) {
        self.session = session
    }

    // MARK: Methods
    
    /// Performs the network request and returns the decoded response.
    ///
    /// - Parameters:
    ///   - url: The URL for the network request.
    ///   - headers: The optional headers. Defaults to an empty dictionary.
    ///   - httpMethod: The HTTP method to be used. Chosen from an enum to avoid string errors.
    ///   - responseType: The type of object to be decoded from the response.
    /// - Returns: The response of the given generic.
    /// - Throws: A URL error if the response is bad or decoding fails.
    ///
    func fetch<T: Decodable>(
        url: URL,
        headers: [String: String] = [:],
        httpMethod: URLMethod,
        responseType: T.Type
    ) async throws -> T {
        // Form the request
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }

        // Make the request
        let (data, response) = try await session.data(for: request)

        // Validate the response
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        // Decode and return the response
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    }

    // MARK: Nested Enums

    /// The available URL methods.
    enum URLMethod: String {
        case delete = "DELETE"
        case get = "GET"
        case post = "POST"
        case put = "PUT"
    }
}
