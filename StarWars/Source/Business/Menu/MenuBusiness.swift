//
//  MenuBusiness.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 03/04/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Foundation

class MenuBusiness {
       
    func getMenu() -> [MenuItem] {
        
        return [MenuItem("PERSONAGENS", "chars"),
                MenuItem("FILMES", "movies"),
                MenuItem("MUNDOS", "worlds"),
                MenuItem("NAVES", "ships")]
    }
}
