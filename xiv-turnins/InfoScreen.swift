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
                LinearGradient(colors: [.pink, .blue], startPoint: .topTrailing, endPoint: .bottomLeading)
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    Text("This app is designed to help find information on Grand Company Supply Provisioning missions in Final Fantasy XIV. These items can be found by talking to the Provisioning Officer in Gridania, Ul'dah or Limsa Lominsa, as well as in the Timers menu.\n\nUse the camera icon to select an image of the item list. The main screen will be populated with the items and links to their respective Teamcraft pages automatically.")
                    Divider()
                    Text("Made with ❤️ by Tou Louse | Famfrit")
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
            }
        }
    }
}

struct InfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        InfoScreen()
    }
}
