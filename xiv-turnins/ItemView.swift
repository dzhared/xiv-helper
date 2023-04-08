//
//  ItemView.swift
//  xiv-turnins
//
//  Created by Jared on 3/14/23.
//

import SwiftUI
import SafariServices

struct ItemView: View {
    
    // MARK: - Properties
    
//    let deliverable: Deliverable
    let item: Item
    
    @Environment(\.openURL) var openURL
    @State private var isShowingSafariView = false
    
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
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
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
                .padding()
                .background(.ultraThickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding([.horizontal])
            }
        }
    }
    
    // MARK: - Structs
    
    struct RecipeButtonView: View {
        let url: URL
        
        @State private var isShowingSafariView = false
        @Environment(\.openURL) var openURL
        
        var body: some View {
            Button(action: {
                isShowingSafariView = true
            }, label: {
                Text("See recipe on Teamcraft ") +
                Text(Image(systemName: "arrow.up.right.square"))
            })
            .sheet(isPresented: $isShowingSafariView) {
                SafariView(url: url)
            }
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> some SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // No-op
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
