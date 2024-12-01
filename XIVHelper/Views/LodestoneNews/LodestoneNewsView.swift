import SwiftUI
import CachedAsyncImage

/// The view displaying Lodestone News articles.
struct LodestoneNewsView: View {

    // MARK: Properties

    /// The response retrieved from the Lodestone News API.
    @State private var response: LodestoneNewsResponse?

    /// The articles to display, aggregated and sorted by date.
    private var articlesToDisplay: [any LodestoneNews] {
        guard let response else { return [] }

        var allArticles: [any LodestoneNews] = []
        allArticles.append(contentsOf: response.topics)

        // TODO: Add these and allow filtering
        // allArticles.append(contentsOf: response.developers)
        // allArticles.append(contentsOf: response.maintenance)
        // allArticles.append(contentsOf: response.notices)
        // allArticles.append(contentsOf: response.status)
        // allArticles.append(contentsOf: response.updates)

        return allArticles.sorted {
            $0.time > $1.time
        }
    }

    /// The arrangement of columns for the `LazyVGrid`.
    private var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 300))]
    }

    /// Whether the user has attempted to load the articles already.
    @State private var hasLoadedArticles = false

    /// The current Dynamic Type size.
    @Environment(\.dynamicTypeSize) private var size

    // MARK: Body

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .leading, spacing: 16) {
                    ForEach(articlesToDisplay, id: \.id) {
                        newsCard(article: $0)
                    }
                    if articlesToDisplay.isEmpty {
                        Button {
                            getLodestoneNews { response in
                                Task { @MainActor in
                                    self.response = response
                                }
                            }
                        } label: {
                            retryCard()
                        }
                    }
                }
            }
            .contentMargins(.bottom, 16)
            .navigationTitle(AppStrings.Navigation.lodestoneNews)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            if articlesToDisplay.isEmpty {
                getLodestoneNews { response in
                    Task { @MainActor in
                        self.response = response
                    }
                }
            }
        }
    }

    // MARK: ViewBuilders

    /// A card displaying a preview of the article.
    @ViewBuilder func newsCard(article: any LodestoneNews) -> some View {
        VStack {
            if let image = article.image {
                CachedAsyncImage(url: URL(string: image)) {
                    $0
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                        .frame(width: 360, height: 90)
                }
                .padding(.bottom, -16)
            }
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.headline)
                    .foregroundStyle(Color.primary)
                Text(article.time.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
                if let description = article.description {
                    Divider()
                    Text(description)
                        .font(.body)
                        .foregroundStyle(Color.primary)
                        .lineLimit(3, reservesSpace: true)
                }
                Divider()
                NavigationLink(destination: LodestoneNewsArticleView(article: article)) {
                    Text(AppStrings.LodestoneNews.keepReading)
                        .bold()
                        .padding(.top, 4)
                }
            }
            .padding()
        }
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 4)
        .multilineTextAlignment(.leading)
        .padding(.horizontal)
    }

    /// A card to retry loading articles.
    @ViewBuilder func retryCard() -> some View {
        VStack {
            Image(.lodestoneNewsPlaceholder)
                .resizable()
                .scaledToFit()
            Text(hasLoadedArticles
                 ? AppStrings.LodestoneNews.tapToRetry
                 : AppStrings.LodestoneNews.tapToLoad
            )
            .font(.headline)
            .multilineTextAlignment(.center)
            .padding()
            .padding(.bottom, 8)
        }
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 4)
        .padding(.horizontal)
    }

    // MARK: Private Methods

    /// Attempt to load the articles.
    @MainActor private func getLodestoneNews(completion: @escaping @Sendable (LodestoneNewsResponse) -> Void) {
        let url: URL = {
            switch GameLocale.localeForDevice() {
            case .en:
                return URL(string: "https://lodestonenews.com/news/all?locale=en")!
            case .de:
                return URL(string: "https://lodestonenews.com/news/all?locale=de")!
            case .fr:
                return URL(string: "https://lodestonenews.com/news/all?locale=fr")!
            case .ja:
                return URL(string: "https://lodestonenews.com/news/all?locale=jp")!
            default:
                return URL(string: "https://lodestonenews.com/news/all")!
            }
        }()

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared

        let task = session.dataTask(with: request) { (data, response, error) in
            if let error {
                print("Error while retrieving articles: \(error)")
                Task { @MainActor in
                    completion(.empty)
                }
                return
            }
            guard let data else {
                print("Error while retrieving articles: received invalid data")
                Task { @MainActor in
                    completion(.empty)
                }
                return
            }
            do {
                // Decode JSON into articles
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decoded = try decoder.decode(LodestoneNewsResponse.self, from: data)
                Task { @MainActor in
                    completion(decoded)
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
