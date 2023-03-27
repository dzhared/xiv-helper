//
//  InfoScreen.swift
//  xiv-turnins
//
//  Created by Jared on 3/19/23.
//

import SwiftUI

struct InfoScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.pink, .blue], startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.top)
                List {
                    Text("This app is designed to help find information on Grand Company Supply missions in Final Fantasy XIV. These items can be found by talking to the Personnel Officer in Gridania, Ul'dah or Limsa Lominsa, as well as in the Timers menu.\n\nTap the camera icon in the Deliverables screen to select an image of the item list from your Photos library. The main screen will be populated with the items and links to their respective Teamcraft pages automatically.")
                    Section {
                        NavigationLink(destination: List {
                            Text("Item photos and IDs retrieved from XIVAPI:\nhttps://xivapi.com/")
                            Text("All crafting information can be found at FFXIV Teamcraft:\nhttps://ffxivteamcraft.com/")
                            Text("News retrieved from Lodestone News API:\nhttps://lodestonenews.com/")
                        }.navigationTitle("Credits")) {
                            Text("Credits")
                        }
                        NavigationLink(destination: List {
                            Text("XIV Helper is not an official product of Final Fantasy XIV or Square Enix, Inc. All game and news content shown in the app is owned by Square Enix, and the use of such content is permitted only for non-commercial purposes, in accordance with the Materials Usage License, as specified on the Final Fantasy XIV website.\n\n© SQUARE ENIX CO., LTD. All Rights Reserved.")
                        }.navigationTitle("Legal")) {
                            Text("Legal")
                        }
                        Link(destination: URL(string: "https://sites.google.com/view/xivhelper-privacypolicy")!) {
                            Text("Privacy Policy")
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("About")
        }
    }
}

struct InfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        InfoScreen()
    }
}
