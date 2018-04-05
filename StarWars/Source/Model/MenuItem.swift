//
//  MenuItem.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 27/03/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

struct MenuItem{
    var title, imageName: String?
    
    init(_ title: String, _ imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
