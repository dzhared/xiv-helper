//
//  ContentView.swift
//  xiv-turnins
//
//  Created by Jared on 3/13/23.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State var showStartScreen = false
    
    @State private var showingInfoScreen: Bool = false
    @State private var scannedItems = scanText(imageName: "exampleImage")
    @State private var deliverables: [Deliverable] = []
    
    @State private var selectedPhotosPickerItem: PhotosPickerItem?
    
    var body: some View {
        NavigationView {
            ScrollView {
                TimerView()
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
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    PhotosPicker(selection: $selectedPhotosPickerItem) {
                        Image(systemName: "camera")
                    }
                }
            }
        }
        .onAppear {
            print(scannedItems) // For debugging
            for itemName in scannedItems.sorted() {
                getDeliverable(itemName: itemName) { deliverable in
                    if let deliverable = deliverable {
                        DispatchQueue.main.async {
                            self.deliverables.append(deliverable)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showingInfoScreen) {
            InfoScreen()
                .presentationDetents([.medium])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
