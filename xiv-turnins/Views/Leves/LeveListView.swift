//
//  LeveListView.swift
//  xiv-turnins
//
//  Created by Jared on 5/22/23.
//

import SwiftUI

struct LeveListView: View {
    
    @State private var leveType: LeveType = .crafting
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Picker("Levequest Type", selection: $leveType) {
                    ForEach(LeveType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding([.horizontal, .bottom])
                Text("Searching \(searchText) in \(leveType.rawValue)")
            }
            .searchable(text: $searchText)
            .navigationTitle("Levequests")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

enum LeveType: String, CaseIterable {
    case crafting = "Crafting"
    case gathering = "Gathering"
}

struct LeveListView_Previews: PreviewProvider {
    static var previews: some View {
        LeveListView()
    }
}
