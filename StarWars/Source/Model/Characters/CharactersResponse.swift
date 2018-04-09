//
//  CharactersResponse.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 09/04/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Foundation

struct CharactersResponse: Codable {
    
    var people: [Character]?
    
    enum CodingKeys: String, CodingKey {
        case people
    }
}
