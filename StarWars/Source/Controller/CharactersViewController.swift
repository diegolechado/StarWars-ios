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
    var characters: [Character]?
    
    private lazy var business = {
        return CharactersBusiness()
    }()
    
    override func viewDidLoad() {
        fetchCharacters()
    }
    
    func fetchCharacters() {
        business.getCharacters(successCompletion: { [weak self] (characters) in
            self?.characters = characters
            self?.charactersView.characterCollectionView.reloadData()
        }) { (error) in
            
        }
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
        return (self.characters != nil) ? self.characters!.count : 0
    }
}
