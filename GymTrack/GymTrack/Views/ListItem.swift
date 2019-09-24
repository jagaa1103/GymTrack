//
//  ListItem.swift
//  GymTrack
//
//  Created by Enkhjargal Gansukh on 24/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import SwiftUI

struct ListItem: View {
    var item: Item
    var body: some View {
        NavigationLink(destination: GestureDetail(item: item)){
            Text(item.name)
        }
    }
}
