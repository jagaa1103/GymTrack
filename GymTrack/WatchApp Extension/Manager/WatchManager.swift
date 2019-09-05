//
//  WatchManager.swift
//  WatchApp Extension
//
//  Created by Enkhjargal Gansukh on 03/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import WatchConnectivity

class WatchManager: NSObject, WCSessionDelegate, JSONParserProtocol {
    
    
    var session: WCSession?
    override init() {
        super.init()
        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
    }
    
    func sessionReachabilityDidChange(_ session: WCSession) {
        print(session.isReachable)
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            print("Watch activated")
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
    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        print(messageData)
    }
    
    func sendMessage(message: String, type: String) {
        session?.sendMessage([type: message], replyHandler: nil, errorHandler: nil)
    }
    func sendData(data: Data){
        session?.sendMessageData(data, replyHandler: nil, errorHandler: nil)
    }
    
    var count = 0
    func addCount(){
        count += 1
        let data = GestureData(name: "Barbell Curl", count: count)
        if let jsonString = toJSON(items: data) {
            print(jsonString)
            sendMessage(message: jsonString, type: "GestureData")
        }
    }
}
