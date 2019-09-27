//
//  Logger.swift
//  GymTrack
//
//  Created by Enkhjargal Gansukh on 26/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import Foundation


class Logger {
    static let instance = Logger()
    func log(tag: String, message: String){
        print("\(tag):" + message)
    }
}
