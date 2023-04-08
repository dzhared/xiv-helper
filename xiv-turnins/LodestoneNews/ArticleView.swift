//
//  ArticleView.swift
//  xiv-turnins
//
//  Created by Jared on 3/26/23.
//

import SwiftUI

struct ArticleView: View {
    let article: LodestoneNews
    var url: URL {
        URL(string: article.url)!
    }
    
    var body: some View {
        NavigationView {
            VStack {
                AsyncImage(url: URL(string: article.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                ScrollView {
                    VStack(alignment: .leading) {
                        Text(article.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Divider()
                        Text(article.description)
                    }
                }
                .padding(.horizontal)
            }
            .toolbar() {
                ToolbarItem(placement: .bottomBar) {
                    Link(destination: url) {
                        Label("Open in Web Browser", systemImage: "globe")
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    ShareLink(item: URL(string: article.url)!) {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: LodestoneNews(
            id: "0bb6b9ddf074dcf3738acddd4391b9d9b3b0c54c",
            url: "https://na.finalfantasyxiv.com/lodestone/topics/detail/0bb6b9ddf074dcf3738acddd4391b9d9b3b0c54c",
            title: "Letter from the Producer LIVE Part LXIV Digest Released",
            image: "https://img.finalfantasyxiv.com/t/0bb6b9ddf074dcf3738acddd4391b9d9b3b0c54c.png?1622102284",
            description: "We’re pleased to announce that the Letter from the Producer LIVE Part LXIV event digest has been released!\n\nIf you weren’t able to watch the live stream, or if you just want to watch it again, be sure to check it out!",
            time: Date(timeIntervalSince1970: 1622102400)))
    }
}
