//
//  ItemView.swift
//  xiv-turnins
//
//  Created by Jared on 3/14/23.
//

import SwiftUI
import SafariServices

struct ItemView: View {
    
    @Environment(\.openURL) var openURL
    @State private var isShowingSafariView = false
    
    let item: Deliverable
    
    var body: some View {
        Section {
            HStack {
                AsyncImage(url: URL(string:"https://xivapi.com\(item.icon.replacingOccurrences(of: ".png", with: "_hr1.png"))")) { image in
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
                    Button(action: {
                        isShowingSafariView = true
                    }, label: {
                        Text("See recipe on Teamcraft")
                        Image(systemName: "arrow.up.right.square")
                    })
                    .sheet(isPresented: $isShowingSafariView) {
                        SafariView(url: URL(string: item.recipeURL)!)
                    }
                    
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
