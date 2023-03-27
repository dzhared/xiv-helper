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
                    Text("This app is designed to help find information on Grand Company Supply Provisioning missions in Final Fantasy XIV. These items can be found by talking to the Provisioning Officer in Gridania, Ul'dah or Limsa Lominsa, as well as in the Timers menu.\n\nUse the camera icon to select an image of the item list. The main screen will be populated with the items and links to their respective Teamcraft pages automatically.")
                    Text("Made with ❤️ by Tou Louse | Famfrit")
                    Section {
                        NavigationLink(destination: List {
                            Text("Please note: XIV Helper is not an official product of Final Fantasy XIV or Square Enix, Inc. All game and news content shown in the app is owned by Square Enix, and the use of such content is permitted only for non-commercial purposes, in accordance with the Materials Usage License effective February 28, 2023, as specified on the Final Fantasy XIV website.\n\n© SQUARE ENIX CO., LTD. All Rights Reserved.")
                        }.navigationTitle("Legal")) {
                            Text("Legal")
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("About XIV Helper")
        }
    }
}

struct InfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        InfoScreen()
    }
}
