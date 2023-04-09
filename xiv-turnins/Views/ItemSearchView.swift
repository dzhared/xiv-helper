//
//  ItemSearchView.swift
//  xiv-turnins
//
//  Created by Jared on 4/8/23.
//

import SwiftUI

struct ItemSearchView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var searchText: String = ""
    @State private var searchResults: [Result] = []
    @State var selectedItem: Item? = nil
    
    var onItemSelected: ((Item?) -> Void)
    
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
                searchItems(for: searchText) { results in
                    searchResults = results
                }
            }
            .searchable(text: $searchText, prompt: "Search (i.e., \"Lemonade\")")
        }
    }
}

struct ItemSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ItemSearchView(onItemSelected: { _ in })
    }
}
