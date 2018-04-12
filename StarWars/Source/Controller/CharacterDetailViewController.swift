//
//  CharacterDetailViewController.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 11/04/2018.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet var characterDetailView: CharacterDetailsView!
    
    var character: Character?
    
    override func viewDidLoad() {
        if let character = self.character{
            self.characterDetailView.setupView(character)
        }
        
    }
}
