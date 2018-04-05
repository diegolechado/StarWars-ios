//
//  CharactersViewController.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 05/04/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Foundation
import UIKit

class CharactersViewController: UIViewController {
    
    @IBOutlet var charactersView: CharacterView!
    
    override func viewDidLoad() {
    }
}

extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharactersCell", for: indexPath) as! CharactersCollectionViewCell
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
}
