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
    
    // MARK: - View
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TimerView()
                if items.isEmpty {
                    PhotosPicker(selection: $selectedPhotosPickerItem, matching: .images) {
                        Text("No items added. Tap to begin:")
                        Image(systemName: "camera")
                    }
                    .padding()
                    .background(.ultraThickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                }
                ForEach(items, id: \.id) { item in
                    ItemView(item: item)
                }
            }
            .navigationTitle("XIV Helper")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar() {
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
        .onAppear {
            if items.isEmpty {
                getItems()
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
                items = []
                scannedItems = scanText(image: UIImage(data: data)!)
                getItems()
            }
        }
        .alert("Delete items?", isPresented: $showingDeleteConfirmation) {
            Button("Cancel", role: .cancel) {  }
            Button("Delete", role: .destructive) {
                items = []
            }
        } message: {
            Text("This cannot be undone.")
        }
    }
    
    // MARK: - Functions
    
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
                        }
                    }
                }
            }
        }
    }
}

struct DeliverableView_Previews: PreviewProvider {
    static var previews: some View {
        DeliverableView()
    }
}
