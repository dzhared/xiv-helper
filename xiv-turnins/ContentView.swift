//
//  ContentView.swift
//  xiv-turnins
//
//  Created by Jared on 3/13/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ItemListView()
                .tabItem {
                    Label("Crafting", systemImage: "hammer")
                }
                .tag(0)
            
            LeveListView()
                .tabItem {
                    Label("Levequests", systemImage: "rectangle.portrait.on.rectangle.portrait.angled")
                }
                .tag(1)
            
            LodestoneNewsView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
                .tag(2)
            
            InfoScreen()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
                .tag(3)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
