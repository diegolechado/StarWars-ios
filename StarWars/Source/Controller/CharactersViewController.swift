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
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    func fetchCharacters() {
        business.getCharacters(successCompletion: { [weak self] (characters) in
            self?.characters = characters
            self?.charactersView.characterCollectionView.reloadData()
        }) { (error) in
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let currentCell = sender as? CharactersCollectionViewCell,
            let viewController = segue.destination as? CharacterDetailViewController,
            let currentCellIndex = self.charactersView.characterCollectionView.indexPath(for: currentCell) {
            viewController.character = self.characters![currentCellIndex.row]
            viewController.view.hero.id = viewController.character?.id
        }
    }
}

extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.characters != nil) ? self.characters!.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharactersCell", for: indexPath) as! CharactersCollectionViewCell
        
        self.characters?[indexPath.row].id = "\(indexPath.row)"
        
        if let character = self.characters?[indexPath.row]{
            cell.bind(character: character)
        }
    
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
