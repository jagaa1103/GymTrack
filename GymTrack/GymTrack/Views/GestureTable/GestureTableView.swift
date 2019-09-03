//
//  GestureList.swift
//  GymTrack
//
//  Created by Enkhjargal Gansukh on 03/09/2019.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class GestureTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    var gestureDelegate: GestureTableProtocol?
    let gestures = ["Barbell Curl", "Dumbbell Bicep", "Hammer Curl"]
    
   
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gestures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = gestures[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = gestureDelegate {
            delegate.didSelected(type: gestures[indexPath.row])
        }
    }
}


protocol GestureTableProtocol {
    func didSelected(type: String)
}
