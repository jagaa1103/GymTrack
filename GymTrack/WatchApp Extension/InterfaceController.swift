//
//  InterfaceController.swift
//  WatchApp Extension
//
//  Created by Enkhjargal Gansukh on 03/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController, MotionProtocol {
    var watchManager: WatchManager?
    let motionManager = MotionManager()
    
    @IBOutlet var motionButton: WKInterfaceButton!
    
    @IBAction func increaseCount() {
        watchManager?.addCount()
    }
    @IBAction func startMotion() {
        switch motionManager.checkState() {
        case .failed:
            motionManager.startMotion()
        case .notsupport:
            motionManager.startMotion()
        case .started:
            motionManager.stopMotion()
        case .stopped:
            motionManager.startMotion()
        }
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        watchManager = WatchManager()
        motionManager.motionDelegate = self
        motionButton.setTitle("start motion")
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func motionStateChanged(state: MotionState) {
        switch state {
        case .failed:
            presentAlert(withTitle: "Motion Alert", message: "Motion start failed", preferredStyle: .alert, actions: [])
            break
        case .notsupport:
            presentAlert(withTitle: "Motion Alert", message: "Motion is not support", preferredStyle: .alert, actions: [])
            break
        case .started:
            motionButton.setTitle("stop motion")
            break
        case .stopped:
            motionButton.setTitle("start motion")
            break
        }
    }

}
