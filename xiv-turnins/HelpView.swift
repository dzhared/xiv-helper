//
//  HelpView.swift
//  xiv-turnins
//
//  Created by Jared on 3/28/23.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("exampleImageFull")
                    .resizable()
                    .scaledToFit()
            }
            .padding()
            .navigationTitle("Help")
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
