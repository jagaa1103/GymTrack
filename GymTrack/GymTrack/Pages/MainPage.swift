//
//  MainView.swift
//  GymTrack
//
//  Created by Enkhjargal Gansukh on 29/08/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import UIKit

class MainPage: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureListView = GestureTableView(frame: self.view.frame, style: .plain)
        gestureListView.gestureDelegate = self
        self.view.addSubview(gestureListView)
    }
}

extension MainPage: GestureTableProtocol {
    
    func didSelected(type: String) {
        print(type)
        let gestureDetail = GestureDetailPage()
        self.present(gestureDetail, animated: true, completion: nil)
    }
    
}
