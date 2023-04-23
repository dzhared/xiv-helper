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
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: Item.example)
    }
}
