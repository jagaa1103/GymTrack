//
//  WatchManager.swift
//  WatchApp Extension
//
//  Created by Enkhjargal Gansukh on 03/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import WatchConnectivity

class WatchManager: NSObject, WCSessionDelegate {
    
    
    var session: WCSession?
    override init() {
        super.init()
        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            print("Watch activated")
            self.sendMessage(message: "Hello, I'm your watch")
            break
        case .inactive:
            print("Watch inactive")
            break
        case .notActivated:
            print("Watch not active")
            break
        default: break
        }
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print(message)
    }
    
    func sendMessage(message: String) {
        let m = ["fromWatch": message];
        session?.sendMessage(m, replyHandler: nil, errorHandler: nil)
    }
    func sendData(data: Data){
        session?.sendMessageData(data, replyHandler: nil, errorHandler: nil)
    }
}
