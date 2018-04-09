//
//  CharactersApiProvider.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 09/04/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Foundation

class CharactersApiProvider: CharactersApiProtocol{
    
    private let charactersEndpoint = "people"
    
    func fetchCharacters(success: @escaping SuccessCallback, failure: @escaping FailureCallback) {
        ApiProvider.getWith(urlExtension: charactersEndpoint, successBlock: { (data) in
            success(data)
        }) { (error) in
            failure(error)
        }
    }
}
