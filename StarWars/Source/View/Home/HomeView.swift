//
//  HomeView.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 14/03/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import UIKit

class HomeView: UIView{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    func alignLogo() {
        UIView.animate(withDuration: 1.5) {
            self.logoImageView.frame.origin.y = 30
        }
        
        UIView.animate(withDuration: 2.0) {
            self.tableView.alpha = 1
        }
    }
}
