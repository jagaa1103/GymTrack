//
//  GestureDetail.swift
//  GymTrack
//
//  Created by Enkhjargal Gansukh on 24/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import SwiftUI

struct GestureDetail: View {
    @ObservedObject var gestureManager = GestureManager()
    var item: Item
    var body: some View {
        VStack {
//            WatchConnectionView(connectionState: connectionState)
            Text("\(gestureManager.count)").padding()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}
