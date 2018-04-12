//
//  Characters.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 09/04/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Foundation

struct Character: Codable {
    
    var image: String?
    var edited: String?
    var name: String?
    var created: String?
    var gender: String?
    var skinColor: String?
    var hairColor: String?
    var height: String?
    var eyeColor: String?
    var mass: String?
    var homeworld: Int?
    var birthYear: String?
    var id: String?
    
    enum CodingKeys: String, CodingKey {
        case image
        case edited
        case name
        case created
        case gender
        case skinColor = "skin_color"
        case hairColor = "hair_color"
        case height
        case eyeColor = "eye_color"
        case mass
        case homeworld
        case birthYear = "birth_year"
        case id
    }
}
