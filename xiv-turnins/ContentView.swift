//
//  ContentView.swift
//  xiv-turnins
//
//  Created by Jared on 3/13/23.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @State private var showingInfoScreen: Bool = false
    @State private var scannedItems = scanText(image: UIImage(named: "exampleImageFull")!)
    @State private var deliverables: [Deliverable] = []
    
    @State private var selectedPhotosPickerItem: PhotosPickerItem?
    @State private var selectedPhotosPickerItemData: Data?
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            ScrollView {
                TimerView()
                if deliverables.isEmpty {
                    PhotosPicker(selection: $selectedPhotosPickerItem, matching: .images) {
                        Text("No items added. Tap to begin:")
                        Image(systemName: "camera")
                    }
                    .padding()
                    .background(.ultraThickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                }
                ForEach(deliverables, id: \.id) { item in
                    ItemView(item: item)
                }
            }
            .navigationTitle("XIV Helper")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar() {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showingInfoScreen = true }) {
                        Image(systemName: "info.circle")
                            .accessibilityLabel("App information")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    PhotosPicker(selection: $selectedPhotosPickerItem, matching: .images) {
                        Image(systemName: "camera")
                            .accessibilityLabel("Select screenshot")
                    }
                }
            }
        }
        .onAppear {
            populateItems()
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
                deliverables = []
                scannedItems = scanText(image: UIImage(data: data)!)
                populateItems()
            }
        }
        .sheet(isPresented: $showingInfoScreen) {
            InfoScreen()
                .presentationDetents([.medium])
        }
    }
    
    // MARK: - Functions
    
    func updatePhotosPickerItem(with item: PhotosPickerItem) async {
        selectedPhotosPickerItem = item
        if let photoData = try? await item.loadTransferable(type: Data.self) {
            selectedPhotosPickerItemData = photoData
        }
    }
    
    func populateItems() {
        for itemName in scannedItems.0.sorted() {
            getDeliverable(itemName: itemName) { deliverable in
                if let deliverable = deliverable {
                    DispatchQueue.main.async {
                        self.deliverables.append(deliverable)
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
