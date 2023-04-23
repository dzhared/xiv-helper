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
            DeliverableView()
                .tabItem {
                    Label("Crafting", systemImage: "hammer")
                }
                .tag(0)
            LodestoneNewsView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
                .tag(1)
            InfoScreen()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
                .tag(2)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
