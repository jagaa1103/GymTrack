//
//  GestureDetail.swift
//  GymTrack
//
//  Created by Enkhjargal Gansukh on 24/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import SwiftUI

struct GestureDetail: View{
    var item: Item
    @State var count = 0
    @State var watchState: ConnectionState = .disconnected
    let watchManager = WatchManager()
    var body: some View {
        VStack {
            WatchConnectionView(connectionState: watchState)
            Text(item.description)
            Text("\(count)")
                .font(.system(size: 32))
                .padding()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

extension GestureDetail: WatchManagerProtocol {
    func didStateChanged(state: ConnectionState) {
        switch state {
        case .connected:
            watchState = .connected
            break
        case .disconnected:
            watchState = .disconnected
            break
        }
    }
    
    func didUpdateCount(number: Int) {
        count = number
    }
}
