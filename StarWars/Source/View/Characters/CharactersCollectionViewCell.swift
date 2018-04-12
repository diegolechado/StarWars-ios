//
//  CharactersCollectionViewCell.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 05/04/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import Hero

class CharactersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var charactersImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 3.0
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize(width: 2
            , height: 4)
        clipsToBounds = false
    }
    
    func bind(character: Character){
        hero.id = character.id
        
        self.nameLabel.text = character.name
        
        if let imageUrl = character.image {
            let url = URL(string: ApiProvider.imagesBaseUrl + imageUrl)
            self.charactersImage.kf.setImage(with: url)
        }else{
            self.charactersImage.image = nil
        }
    }
}

