import SwiftUI

// MARK: - LeveListView

struct LeveListView: View {
    
    // MARK: Properties
    
    /// The leves to be displayed.
    @State private var leves: [Leve] = []
    
    /// The currently selected `LeveType`.
    @State private var selectedLeveType: LeveType = .crafting
    
    /// The search text currently entered.
    @State private var searchText = ""
    
    /// Currently showing the search view.
    @State private var showingSearchView: Bool = false
    
    /// The file location to save `items` to for persistent storage.
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedLeves")
    
    // MARK: Body
    
    var body: some View {
        NavigationStack {
            List {
                if leves.isEmpty {
                    Button {
                        showingSearchView = true
                    } label: {
                        Text("No leves added. Tap to search.")
                    }
                }
                ForEach(leves, id: \.id) { leve in
                    LeveView(leve: leve)
                }
            }
            .sheet(isPresented: $showingSearchView) {
                ItemSearchView(
                    queryType: .leve,
                    onLeveSelected: { leve in
                        if let selectedLeve = leve {
                            if !leves.contains(where: { $0 == selectedLeve }) {
                                leves.append(selectedLeve)
                                save()
                                showingSearchView = false
                            }
                        }
                    }
                )
            }
            .navigationTitle("Levequests")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Picker("Levequest Type", selection: $selectedLeveType) {
                        ForEach(LeveType.allCases, id: \.self) { type in
                            Text(type.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingSearchView = true
                    } label: {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    
                }
            }
        }
    }
    
    init() {
        load()
    }
    
    func load() {
        do {
            let data = try Data(contentsOf: savePath)
            leves = try JSONDecoder().decode([Leve].self, from: data)
        } catch {
            print("Failed to load: \(error.localizedDescription)")
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(leves)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save items: \(error.localizedDescription)")
        }
    }
}

// MARK: - PreviewProvider

struct LeveListView_Previews: PreviewProvider {
    static var previews: some View {
        LeveListView()
    }
}
