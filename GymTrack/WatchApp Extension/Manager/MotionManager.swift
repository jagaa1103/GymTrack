//
//  MotionManager.swift
//  WatchApp Extension
//
//  Created by Enkhjargal Gansukh on 05/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import CoreMotion

class MotionManager: NSObject {
    let motionManager = CMMotionManager()
    var motionDelegate: MotionProtocol?
    var state: MotionState = .stopped
    func startMotion(){
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.01
            state = .started
            motionDelegate?.motionStateChanged(state: .started)
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: { (motionData: CMDeviceMotion?, error: Error? ) in
                if let err = error {
                    print(err.localizedDescription)
                    self.state = .failed
                    self.motionDelegate?.motionStateChanged(state: .failed)
                }else{
                    if let data = motionData {
                        print("motion data ::: accel \(data.userAcceleration.x), \(data.userAcceleration.y), \(data.userAcceleration.z), gyro: \(data.rotationRate.x), \(data.rotationRate.y), \(data.rotationRate.z)")
                    }
                }
            })
        }else {
            state = .notsupport
            motionDelegate?.motionStateChanged(state: .notsupport)
        }
    }
    
    func stopMotion(){
        state = .stopped
        motionDelegate?.motionStateChanged(state: .stopped)
        motionManager.stopDeviceMotionUpdates()
    }
    
    func checkState()-> MotionState {
        return state
    }
}

protocol MotionProtocol {
    func motionStateChanged(state: MotionState)
}

enum MotionState {
    case started
    case stopped
    case failed
    case notsupport
}
