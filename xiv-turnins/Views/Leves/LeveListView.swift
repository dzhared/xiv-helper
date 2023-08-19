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
    
    // MARK: Body
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(leves, id: \.id) { leve in
                    LeveView(leve: leve)
                }
            }
            .searchable(text: $searchText)
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
            }
        }
    }
}

// MARK: - PreviewProvider

struct LeveListView_Previews: PreviewProvider {
    static var previews: some View {
        LeveListView()
    }
}
