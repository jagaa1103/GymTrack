//
//  MainView.swift
//  GymTrack
//
//  Created by Enkhjargal Gansukh on 29/08/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
//        GestureListView()
        Button(action: showDetail, label: { Text("Golf")})
    }
    
    func showDetail(){
        print("Golf")
    }
}
