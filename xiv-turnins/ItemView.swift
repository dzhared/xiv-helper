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
    
    let item: Deliverable
    
    @Environment(\.openURL) var openURL
    @State private var isShowingSafariView = false

    var iconURL: URL? {
        let urlString = "https://xivapi.com\(item.icon.replacingOccurrences(of: ".png", with: "_hr1.png"))"
        return URL(string: urlString)
    }
    
    // MARK: - View
    
    var body: some View {
        Section {
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
                    RecipeButtonView(url: URL(string: item.recipeURL)!)
                }
                .padding([.leading])
                Spacer()
            }
            .padding()
            .background(.ultraThickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding([.horizontal])
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
                Text("See recipe on Teamcraft")
                Image(systemName: "arrow.up.right.square")
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
        ItemView(item: Deliverable(
            name: "Lignum Vitae Fishing Rod",
            id: 27150,
            icon: "/i/038000/038236.png",
            recipe: 4386
        ))
    }
}
