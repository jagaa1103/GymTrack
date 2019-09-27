//
//  GestureManager.swift
//  GymTrack
//
//  Created by Enkhjargal Gansukh on 27/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class GestureManager: ObservableObject {
    let watchManager = WatchManager()
    @Published var count = 0
    
    init() {
        watchManager.delegate = self
    }
}

extension GestureManager: WatchManagerProtocol {
    func didUpdateCount(number: Int) {
        DispatchQueue.main.async {
            self.count += 1
            self.objectWillChange.send()
            print("counter: \(self.count)")
        }
    }
    
    func didStateChanged(state: ConnectionState) {
        
    }
}
