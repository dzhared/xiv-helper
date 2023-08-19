import SwiftUI

// MARK: - ArticleView

struct ArticleView: View {
    
    // MARK: Properties
    
    /// The news article to be displayed.
    let article: LodestoneNews
    
    // MARK: Body
    
    var body: some View {
        NavigationView {
            VStack {
                AsyncImage(url: article.formattedImageURL) { image in
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
                    Link(destination: article.formattedURL) {
                        Label("Open in Web Browser", systemImage: "globe")
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    ShareLink(item: article.formattedURL) {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

// MARK: - PreviewProvider

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: LodestoneNews.example)
    }
}
