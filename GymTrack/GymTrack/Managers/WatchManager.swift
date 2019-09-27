//
//  WatchManager.swift
//  GymTrack
//
//  Created by Enkhjargal Gansukh on 03/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import WatchConnectivity

class WatchManager: NSObject, WCSessionDelegate, JSONParserProtocol {
    static let instance = WatchManager()
    var session: WCSession?
    var delegate: WatchManagerProtocol?
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            session = WCSession.default
        }
        session?.delegate = self
        session?.activate()
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            print("activated")
            delegate?.didStateChanged(state: .connected)
        case .inactive:
            print("inactive")
            delegate?.didStateChanged(state: .disconnected)
        case .notActivated:
            print("not activated")
            delegate?.didStateChanged(state: .disconnected)
        default:
            print("unknown")
            delegate?.didStateChanged(state: .disconnected)
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
        if let countString = message["GestureData"] as? String {
            if let gestureData = stringToJSON(string: countString, type: GestureData.self) {
                delegate?.didUpdateCount(number: gestureData.count)
            }
        }
    }
}

protocol WatchManagerProtocol {
    func didUpdateCount(number: Int)
    func didStateChanged(state: ConnectionState)
}

enum ConnectionState {
    case connected
    case disconnected
}

