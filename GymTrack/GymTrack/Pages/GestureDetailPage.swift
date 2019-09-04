//
//  GestureDetail.swift
//  GymTrack
//
//  Created by Enkhjargal Gansukh on 03/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class GestureDetailPage: UIViewController, WatchManagerProtocol {
    
    let watchManager = WatchManager()
    var countLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        watchManager.watchManagerDelegate = self
        
        let closeButton = UIButton(frame: CGRect(x: self.view.frame.width - 100, y: 50, width: 70, height: 40))
        closeButton.setTitle("Close", for: .normal)
        closeButton.backgroundColor = .gray
        closeButton.addTarget(self, action: #selector(closeClicked), for: .touchUpInside)
        self.view.addSubview(closeButton)
        
        countLabel = UILabel(frame: CGRect(x: 0, y: 150, width: view.frame.width, height: 150))
        countLabel?.text = "0"
        countLabel?.textAlignment = .center
        countLabel?.font = UIFont(name: "Helvetica", size: 80)
        self.view.addSubview(countLabel!)
    }
    
    @objc func closeClicked(sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    func didUpdateCount(number: Int) {
        DispatchQueue.main.async {
            self.countLabel?.text = "\(number)"
        }
    }
}


