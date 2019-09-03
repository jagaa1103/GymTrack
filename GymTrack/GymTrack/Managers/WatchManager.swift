//
//  WatchManager.swift
//  GymTrack
//
//  Created by Enkhjargal Gansukh on 03/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import WatchConnectivity

class WatchManager: NSObject, WCSessionDelegate {
    
    static let instance = WatchManager()
    var session: WCSession?
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            session = WCSession.default
        }
        session?.delegate = self
        session?.activate()
    }
    
    @available(iOS 9.3, *)
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            print("activated")
        case .inactive:
            print("inactive")
        case .notActivated:
            print("not activated")
        default:
            print("unknown")
        }
    }
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("session become inactive")
    }
    func sessionDidDeactivate(_ session: WCSession) {
        print("session deactive")
    }
    
    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        print(messageData)
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print(message)
    }
}
