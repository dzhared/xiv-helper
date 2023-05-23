//
//  LeveDetailView.swift
//  xiv-turnins
//
//  Created by Jared on 5/22/23.
//

import SwiftUI

struct LeveDetailView: View {
    
    let leve: Leve
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Group {
                        Text("Allowance Cost: \(leve.allowanceCost)")
                        if let equipClass = leve.classJobCategory.equipClass {
                            Text("Class: \(equipClass)")
                        }
                        Text("Level: \(leve.classJobLevel)")
                        Text("Description: \(leve.description)")
                        Text("EXP Factor: \(leve.expFactor)")
                        Text("EXP : \(leve.expReward)")
                        Text("ID: \(leve.id)")
                        Text("Client: \(leve.leveClient.name)")
                        HStack {
                            AsyncImage(url: URL(string: "https://xivapi.com/i/060000/060881_hr1.png"))
                            Text(leve.town.name)
                                .font(.title)
                                .padding(.leading)
                        }
                    }
                }
            }
        }
    }
}

struct LeveDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LeveDetailView(leve: Leve.example)
    }
}
