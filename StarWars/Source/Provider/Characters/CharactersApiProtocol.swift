//
//  CharactersApiProtocol.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 09/04/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Foundation

/// Protocol used for Mock proposes
protocol CharactersApiProtocol {
    
    /// Fetch characters
    func fetchCharacters(success: @escaping SuccessCallback, failure: @escaping FailureCallback)
}
