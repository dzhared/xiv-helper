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
    
    /// The item selected in the search.
    @State var selectedItem: Item? = nil
    var onItemSelected: ((Item?) -> Void)
    
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
                        Button(item.name) {
                            getItemFromString(item.name) { item in
                                self.selectedItem = item
                                onItemSelected(item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(role: .cancel, action: { dismiss() }, label: { Text("Cancel") })
                }
            }
            .onChange(of: searchText) { _ in
                searchItems(for: searchText, queryType: .recipe) { results in
                    searchResults = results
                }
            }
            .searchable(text: $searchText, prompt: "Search (i.e., \"Lemonade\")")
        }
    }
}

// MARK: - PreviewProvider

struct ItemSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ItemSearchView(onItemSelected: { _ in })
    }
}
