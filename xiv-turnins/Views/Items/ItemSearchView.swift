import SwiftUI

// MARK: - ItemSearchView

struct ItemSearchView: View {
    
    // MARK: Properties
    
    /// Dismiss the view.
    @Environment(\.dismiss) var dismiss
    
    /// The currently entered text in the search field.
    @State private var searchText: String = ""
    
    /// The results for the search query.
    @State private var searchResults: [Result] = []
    
    /// The type of result to be searched for.
    @State var queryType: QueryType
    
    /// The item selected in the search.
    @State var selectedItem: Item? = nil
    var onItemSelected: ((Item?) -> Void)?
    
    /// The leve selected in the search.
    @State var selectedLeve: Leve? = nil
    var onLeveSelected: ((Leve?) -> Void)?
    
    /// The prompt text for the given `QueryType`.
    private var promptText: String {
        switch queryType {
        case .recipe:
            return "\"Lemonade\""
        case .leve:
            return "\"Bleeding Them Dry\""
        }
    }
    
    // MARK: Body
    
    var body: some View {
        NavigationStack {
            Form {
                if searchText.isEmpty {
                    Text("Start typing to search.")
                } else if searchResults.isEmpty {
                    Text("No results. Please try again.")
                } else {
                    ForEach(searchResults, id: \.id) { item in
                        Button {
                            switch queryType {
                            case .recipe:
                                getItemFromString(item.name) { item in
                                    selectedItem = item
                                    onItemSelected!(item)
                                }
                            case .leve:
                                getLeveFromString(string: item.name) { leve in
                                    selectedLeve = leve
                                    onLeveSelected!(leve)
                                }
                            }
                        } label: {
                            Text(item.name)
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar() {
                ToolbarItem(placement: .cancellationAction) {
                    Button(
                        role: .cancel,
                        action: { dismiss() },
                        label: { Text("Cancel") }
                    )
                }
            }
            .onChange(of: searchText) { _ in
                searchItems(for: searchText, queryType: queryType) { results in
                    searchResults = results
                }
            }
            .searchable(
                text: $searchText,
                prompt: "Search (i.e., \(promptText))"
            )
        }
    }
}

// MARK: - PreviewProvider

struct ItemSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ItemSearchView(
            queryType: .recipe,
            onItemSelected: { _ in }
        )
    }
}
