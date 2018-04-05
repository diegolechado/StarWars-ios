//
//  ViewController.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 12/03/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var homeView: HomeView!
    
    let kSectionsCount = 1
    let kCellIdentifier = "menuCell"
    var menuItens: [MenuItem]?
    
    lazy var menuBusiness = MenuBusiness()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeView.tableView.dataSource = self
        self.homeView.tableView.delegate = self
        self.homeView.tableView.separatorColor = UIColor.black
        self.homeView.tableView.separatorInset = UIEdgeInsetsMake(50,0, 50, 0)
        
        menuItens = menuBusiness.getMenu()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.homeView.alignLogo()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return kSectionsCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (menuItens != nil) ? menuItens!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier) as! HomeMenuTableViewCell
        
        cell.bind(menuItem: menuItens![indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueChars", sender: tableView)
    }
    
}

