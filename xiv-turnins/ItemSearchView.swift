//
//  ItemSearchView.swift
//  xiv-turnins
//
//  Created by Jared on 4/8/23.
//

import SwiftUI

struct ItemSearchView: View {
    @State private var searchText: String = ""
    @State private var searchResults: [Item] = []
    
    var body: some View {
        NavigationStack {
            Form {
                
            }
        }
        .onChange(of: searchText) { _ in
            searchResults = []
        }
        .searchable(text: $searchText)
    }
}

struct ItemSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ItemSearchView()
    }
}
