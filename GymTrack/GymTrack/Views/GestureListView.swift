//
//  GestureListView.swift
//  GymTrack
//
//  Created by Enkhjargal Gansukh on 24/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import SwiftUI

struct Item: Identifiable {
    var id: Int
    var name: String
    var description: String
}

struct GestureListView: View {
    
    var items = [Item(id: 0, name: "Golf", description: "Detecting Golf Swing"), Item(id: 1, name: "Lifting", description: "Detecting Weight Lifting")]

    var body: some View {
        NavigationView {
            List{
                ForEach(items){ ListItem(item: $0) }
            }
            .navigationBarTitle("Gestures")
        }
    }
}
