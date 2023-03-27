//
//  TabView.swift
//  xiv-turnins
//
//  Created by Jared on 3/26/23.
//

import SwiftUI

struct TabTest: View {
    var body: some View {
        TabView {
            Text("Text 1")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Text("Text 2")
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
        }
    }
}

struct TabTest_Previews: PreviewProvider {
    static var previews: some View {
        TabTest()
    }
}
