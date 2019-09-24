//
//  HealthKitManager.swift
//  WatchApp Extension
//
//  Created by Enkhjargal Gansukh on 09/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import HealthKit

class HealthKitManager: NSObject, HKWorkoutSessionDelegate  {
    var session: HKWorkoutSession?
    override init() {
        super.init()
        do{
            let config = HKWorkoutConfiguration()
            session = try HKWorkoutSession(configuration: config)
            session?.delegate = self
        }catch {
            print(error.localizedDescription)
        }
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
        switch toState {
        case .running: break
        case .ended: break
        case .stopped: break
        case .paused: break
        case .notStarted: break
        case .prepared: break
        @unknown default: break
        }
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {

    }
    
    
}
