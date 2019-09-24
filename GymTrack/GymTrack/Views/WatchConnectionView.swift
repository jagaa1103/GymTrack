//
//  WatchConnectionView.swift
//  GymTrack
//
//  Created by Enkhjargal Gansukh on 24/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import SwiftUI

struct WatchConnectionView: View {
    var connectionState: ConnectionState = .disconnected
    var body: some View {
        HStack{
            Text("Watch: ")
            if(connectionState == .connected){
                Text("connected")
            }else{
                Text("disconnected")
            }
        }
    }
}
