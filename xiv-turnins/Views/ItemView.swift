//
//  ItemView.swift
//  xiv-turnins
//
//  Created by Jared on 3/14/23.
//

import SwiftUI

struct ItemView: View {
    
    // MARK: - Properties
    
    let item: Item
    var iconURL: URL? {
        let urlString = "https://xivapi.com\(item.icon)"
        return URL(string: urlString)
    }
    
    // MARK: - View
    
    var body: some View {
        Section {
            NavigationLink(destination: ItemDetailView(item: item)) {
                HStack {
                    AsyncImage(url: iconURL) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .shadow(radius: 10)
                    
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.title3)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                    }
                    .padding([.leading],7)
                    Spacer()
                }
                .padding(10)
                .background(.ultraThickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding([.horizontal], 5)
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item(
            classJobCategory: Item.ClassJobCategory(equipClass: "All Classes"),
            id: 2747,
            icon: "/i/046000/046540_hr1.png",
            levelEquip: 53,
            levelItem: 80,
            name: "Holy Rainbow Shoes",
            itemRecipeInfo: [Item.ItemRecipeInfo(classJobID: 13, id: 2747, level: 54)])
        
        ItemView(item: item)
    }
}
