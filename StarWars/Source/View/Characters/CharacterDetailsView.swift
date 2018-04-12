//
//  CharacterDetailsView.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 11/04/2018.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Foundation
import UIKit

class CharacterDetailsView: UIView{
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    
    func setupView(_ character: Character) {
        if let imageUrl = character.image {
            let url = URL(string: ApiProvider.imagesBaseUrl + imageUrl)
            self.backgroundImageView.kf.setImage(with: url)
        }else{
            self.backgroundImageView.image = nil
        }
        
        self.nameLabel.text = character.name
        self.heightLabel.text = character.height
        self.birthYearLabel.text = character.birthYear
        self.massLabel.text = character.mass
        
    }
}
