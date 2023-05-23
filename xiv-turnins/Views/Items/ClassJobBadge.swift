//
//  ClassJobBadge.swift
//  xiv-turnins
//
//  Created by Jared on 5/22/23.
//

import SwiftUI

struct ClassJobBadge: View {
    
    let classJob: ClassJobCategory
    let level: Int
    
    var body: some View {
        Section {
            HStack {
                Image(classJob.equipClass ?? "RPR")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .topLeading)
                VStack(alignment: .leading) {
                    Text("Level \(level) \(classJob.fullEquipClass)")
                        .font(.title3)
                }
            }
        }
    }
}

struct ClassJobBadge_Previews: PreviewProvider {
    static var previews: some View {
        ClassJobBadge(classJob: ClassJobCategory.example, level: 54)
    }
}
