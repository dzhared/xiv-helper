//
//  InfoScreen.swift
//  xiv-turnins
//
//  Created by Jared on 3/19/23.
//

import SwiftUI

struct InfoScreen: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.pink, .blue], startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.top)
                List {
                    Text(text)
                    Section {
                        NavigationLink(destination: List {
                            Text("Item info and recipes retrieved using XIVAPI:\nhttps://xivapi.com/")
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

let text = """
This app helps find and organize crafting recipes in Final Fantasy XIV. To find and add a recipe, tap the search icon on the Crafting screen and type the item's name.\n\nAdditionally, to help with Grand Company Supply Missions, you can input a screenshot of the Supply Mission menu, found in the in-game Timers menu. Tap the camera icon, then select an image containing the Supply Mission menu from the Camera Roll, and it will automatically populate the Recipes list.
"""

struct InfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        InfoScreen()
    }
}
