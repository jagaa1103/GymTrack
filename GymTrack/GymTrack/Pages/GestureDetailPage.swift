//
//  GestureDetail.swift
//  GymTrack
//
//  Created by Enkhjargal Gansukh on 03/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class GestureDetailPage: UIViewController {
    
    let watchManager = WatchManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let closeButton = UIButton(frame: CGRect(x: self.view.frame.width - 100, y: 50, width: 70, height: 40))
        closeButton.setTitle("Close", for: .normal)
        closeButton.backgroundColor = .gray
        closeButton.addTarget(self, action: #selector(closeClicked), for: .touchUpInside)
        self.view.addSubview(closeButton)
    }
    
    @objc func closeClicked(sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
}


