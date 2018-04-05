//
//  CharactersCollectionViewCell.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 05/04/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Foundation
import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 3.0
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize(width: 2
            , height: 4)
        clipsToBounds = false
    }
}

