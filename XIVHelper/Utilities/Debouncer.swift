import Combine
import Foundation

/// Used to prevent search from occurring too quickly, drastically slowing down the app.
class Debouncer: ObservableObject {

    // MARK: Properties

    /// The search text after being debounced.
    @Published var searchText: String = ""

    /// Publishes the debounced text after the designated delay.
    var searchTextPublisher: AnyPublisher<String, Never> {
        $searchText
            .debounce(for: .milliseconds(100), scheduler: RunLoop.main)
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
}
