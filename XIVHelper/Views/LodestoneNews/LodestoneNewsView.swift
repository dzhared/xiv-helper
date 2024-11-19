import SwiftUI

/// The view displaying Lodestone News articles.
@MainActor struct LodestoneNewsView: View {

    // MARK: Properties

    /// Whether the user has attempted to load the articles already.
    @State private var hasLoadedArticles = false

    /// The articles retrieved from the Lodestone News API.
    @State private var allArticles = [LodestoneNewsArticle]()

    // MARK: Body

    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(allArticles, id: \.id) {
                    newsCard(article: $0)
                }
                if allArticles.isEmpty {
                    Button {
                        getLodestoneNews { articles in
                            Task { @MainActor in
                                allArticles = articles
                            }
                        }
                    } label: {
                        retryCard()
                    }
                }
            }
            .navigationTitle(AppStrings.Navigation.lodestoneNews)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            if allArticles.isEmpty {
                getLodestoneNews { articles in
                    Task { @MainActor in
                        allArticles = articles
                    }
                }
            }
        }
    }

    // MARK: ViewBuilders

    /// A card displaying a preview of the article.
    @ViewBuilder func newsCard(article: LodestoneNewsArticle) -> some View {
        LazyVStack {
            AsyncImage(url: URL(string: article.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
                    .frame(width: 188, height: 720)
            }
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.headline)
                Text("\(article.time.formatted(date: .abbreviated, time: .omitted))")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Divider()
                Text(article.description)
                    .lineLimit(3)
                Divider()
                NavigationLink(destination: LodestoneNewsArticleView(article: article)) {
                    Text("Keep Reading")
                }
            }
            .padding([.horizontal, .bottom])
        }
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 3)
        .multilineTextAlignment(.leading)
        .padding([.horizontal, .bottom])
    }

    /// A card to retry loading articles.
    @ViewBuilder func retryCard() -> some View {
        VStack {
            Image("LodestoneNewsPlaceholder")
                .resizable()
                .scaledToFit()
            Text("Tap to \(hasLoadedArticles ? "retry loading" : "load") articles")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
                .padding(.bottom, 8)
        }
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 3)
        .padding(.horizontal)
    }

    // MARK: Private Methods

    /// Attempt to load the articles.
    private func getLodestoneNews(completion: @escaping @Sendable ([LodestoneNewsArticle]) -> Void) {
        let url = URL(string: "https://na.lodestonenews.com/news/topics")!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared

        let task = session.dataTask(with: request) { (data, response, error) in
            if let error {
                print("Error while retrieving articles: \(error)")
                Task { @MainActor in
                    completion([])
                }
                return
            }
            guard let data else {
                print("Error while retrieving articles: received invalid data")
                Task { @MainActor in
                    completion([])
                }
                return
            }
            do {
                // Decode JSON into articles
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decodedArticles = try decoder.decode([LodestoneNewsArticle].self, from: data)
                Task { @MainActor in
                    completion(decodedArticles)
                }
            } catch {
                print("Error decoding JSON.")
            }
        }
        task.resume()
    }
}

// MARK: Previews

#if DEBUG
#Preview("Lodestone News") {
    LodestoneNewsView()
}
#endif
