//
//  GestureObject.swift
//  GymTrack
//
//  Created by Enkhjargal Gansukh on 27/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//
import Foundation
import Combine

class Gestures: ObservableObject {
    @Published var items = [Gesture]()
}

struct Gesture {
    var id = 0
    var status: GestureState = .none
    var data: Data?
}

enum GestureState {
    case success
    case fail
    case none
}
