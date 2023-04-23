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
    
    @State private var selectedPhotosPickerItem: PhotosPickerItem?
    @State private var selectedPhotosPickerItemData: Data?
    
    @State private var showingDeleteConfirmation = false
    @State private var showingSearchView = false
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedItems")
    
    // MARK: - View
    
    var body: some View {
        NavigationStack {
            List {
                if items.isEmpty {
                    Button("No items added. Tap to search.") { showingSearchView = true }
                }
                ForEach(items, id: \.id) { item in
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
            }
        }
        .onChange(of: selectedPhotosPickerItem) { selectedPhotosPickerItem in
            guard let selectedPhotosPickerItem else {
                return
            }
            Task {
                // Run ML asynchronously upon picking photo
                await updatePhotosPickerItem(with: selectedPhotosPickerItem)
                guard let data = selectedPhotosPickerItemData else {
                    return
                }
                // Regenerate item list
                // Make it so it appends, not deletes?
                items = []
                scannedItems = scanText(image: UIImage(data: data)!)
                getItems()
            }
        }
        .onAppear {
            load()
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
