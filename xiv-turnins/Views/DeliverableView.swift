//
//  DeliverableView.swift
//  xiv-turnins
//
//  Created by Jared on 3/26/23.
//

import PhotosUI
import SwiftUI

struct DeliverableView: View {
    
    // MARK: - Properties
    
    @State private var scannedItems = ([String](), [String]())
    @State private var items: [Item] = []
    
    @State private var sortMethod: SortMethod = .nameAscending
    private var sortedItems: [Item] {
        switch sortMethod {
        case .nameDescending:
            return items.sorted { $1.name < $0.name }
        case .itemLevelAscending:
            return items.sorted { $0.levelItem < $1.levelItem }
        case .itemLevelDescending:
            return items.sorted { $1.levelItem < $0.levelItem }
        case .equipLevelAscending:
            return items.sorted { $0.levelEquip < $1.levelEquip }
        case .equipLevelDescending:
            return items.sorted { $1.levelEquip < $0.levelEquip }
        default:
            return items.sorted { $0.name < $1.name }
        }
    }
    
    enum SortMethod: String, CaseIterable {
        case nameAscending = "Name (ascending)"
        case nameDescending = "Name (descending)"
        case itemLevelAscending = "Item Level (ascending)"
        case itemLevelDescending = "Item Level (descending)"
        case equipLevelAscending = "Equip Level (ascending)"
        case equipLevelDescending = "Equip Level (descending)"
    }
    
    @State private var selectedPhotosPickerItem: PhotosPickerItem?
    @State private var selectedPhotosPickerItemData: Data?
    
    @State private var showingDeleteConfirmation = false
    @State private var showingSearchView = false
    
    @State private var showingSort = false
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedItems")
    
    // MARK: - View
    
    var body: some View {
        NavigationStack {
            List {
                if items.isEmpty {
                    Button("No items added. Tap to search.") { showingSearchView = true }
                }
                ForEach(sortedItems, id: \.id) { item in
                    ItemView(item: item)
                        .swipeActions {
                            Button(role: .destructive) {
                                if let index = items.firstIndex(where: {$0.id == item.id}) {
                                    items.remove(at: index)
                                    save()
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }
            }
            .sheet(isPresented: $showingSearchView) {
                ItemSearchView(onItemSelected: { item in
                    if let selectedItem = item {
                        if !items.contains(where: { $0.name == selectedItem.name }) {
                            self.items.append(selectedItem)
                            save()
                            showingSearchView = false
                        }
                    }
                })
            }
            .navigationTitle("XIV Helper")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    TimerView()
                        .padding(.bottom, 4)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingSearchView = true
                    }, label: {
                        Label("Search item", systemImage: "magnifyingglass")
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    PhotosPicker(selection: $selectedPhotosPickerItem, matching: .images) {
                        Image(systemName: "camera")
                            .accessibilityLabel("Select screenshot")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    if !items.isEmpty {
                        Button(action: {
                            showingDeleteConfirmation = true
                        }) {
                            Image(systemName: "trash")
                                .accessibilityLabel("Delete items")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    if !items.isEmpty {
                        Button {
                            showingSort = true
                        } label: {
                            Image(systemName: "arrow.up.arrow.down")
                        }
                    }
                }
            }
        }
        .onChange(of: selectedPhotosPickerItem) { selectedPhotosPickerItem in
            guard let selectedPhotosPickerItem else {
                return
            }
            Task {
                // Run ML asynchronously upon picking photo
                await updatePhotosPickerItem(with: selectedPhotosPickerItem)
                guard let data = selectedPhotosPickerItemData else { return }
                scannedItems = scanText(image: UIImage(data: data)!)
                getItems()
            }
        }
        .onAppear {
            load()
        }
        .confirmationDialog("Sort by...", isPresented: $showingSort) {
            ForEach(SortMethod.allCases, id: \.self) { method in
                Button(method.rawValue) { sortMethod = method }
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Sort by...")
        }
        .alert("Delete items?", isPresented: $showingDeleteConfirmation) {
            Button("Cancel", role: .cancel) {  }
            Button("Delete", role: .destructive) {
                items = []
                scannedItems = ([], [])
                save()
            }
        } message: {
            Text("This cannot be undone.")
        }
    }
    
    // MARK: - Functions
    
    init() {
        load()
    }
    
    func updatePhotosPickerItem(with item: PhotosPickerItem) async {
        selectedPhotosPickerItem = item
        if let photoData = try? await item.loadTransferable(type: Data.self) {
            selectedPhotosPickerItemData = photoData
        }
    }
    
    func getItems() {
        for itemName in scannedItems.0.sorted() {
            getItemIDFromName(itemName: itemName) { itemID in
                if let itemID = itemID {
                    getItemFromID(itemID: itemID) { item in
                        if let item = item {
                            guard !items.contains(item) else { return }
                            self.items.append(item)
                            save()
                        }
                    }
                }
            }
        }
    }
    
    func load() {
        do {
            let data = try Data(contentsOf: savePath)
            items = try JSONDecoder().decode([Item].self, from: data)
        } catch {
            print("Failed to load: \(error.localizedDescription)")
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save items: \(error.localizedDescription)")
        }
    }
}

struct DeliverableView_Previews: PreviewProvider {
    static var previews: some View {
        DeliverableView()
    }
}
