import SwiftUI

// MARK: - LodestoneNewsView

struct LodestoneNewsView: View {
    
    // MARK: Properties
    
    /// All articles to be displayed.
    @State private var allArticles = [LodestoneNews]()
    
    // MARK: Body
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(allArticles, id: \.id) { article in
                    LazyVStack {
                        AsyncImage(url: article.formattedImageURL) { image in
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
                            Text(article.formattedTime)
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Divider()
                            Text(article.description)
                                .lineLimit(3)
                            Divider()
                            NavigationLink(destination: ArticleView(article: article)) {
                                Text("Keep Reading")
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 3)
                    .multilineTextAlignment(.leading)
                }
            }
            .padding(.horizontal)
            .navigationTitle("News")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            if allArticles.isEmpty {
                getLodestoneNews { articles in
                    allArticles = articles
                }
            }
        }
    }
}

// MARK: Functions

private func getLodestoneNews(completion: @escaping ([LodestoneNews]) -> Void) {
    var articles: [LodestoneNews] = []
    
    let url = URL(string: "https://na.lodestonenews.com/news/topics")!
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let session = URLSession.shared
    
    let task = session.dataTask(with: request) { (data, response, error) in
        guard let data = data, error == nil else {
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Error making API call.")
            }
            return
        }
        
        do {
            // Decode JSON into articles
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            articles = try decoder.decode([LodestoneNews].self, from: data)
            completion(articles)
        } catch {
            print("Error decoding JSON.")
        }
    }
    task.resume()
}

// MARK: - PreviewProvider

struct LodestoneNewsView_Previews: PreviewProvider {
    static var previews: some View {
        LodestoneNewsView()
    }
}
