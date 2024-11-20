import SwiftUI

/// A view to display an individual Lodestone News article.
struct LodestoneNewsArticleView: View {

    // MARK: Properties

    /// The article to be displayed.
    let article: LodestoneNewsArticle

    /// The URL to the full article.
    private var url: URL {
        URL(string: article.url)!
    }

    // MARK: Body

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
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Link(destination: url) {
                        Label(AppStrings.LodestoneNews.openInWebBrowser, systemImage: "globe")
                    }
                    Spacer()
                    Spacer()
                    ShareLink(item: url) {
                        Label(AppStrings.LodestoneNews.share, systemImage: "square.and.arrow.up")
                    }
                    Spacer()
                }
            }
        }
    }
}

// MARK: Previews

#if DEBUG
#Preview("Article") {
    LodestoneNewsArticleView(article: .example)
}
#endif
