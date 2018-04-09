//
//  CharactersBusiness.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 09/04/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Foundation

typealias SuccessCharactersCompletion = (_ user: [Character]?) -> Swift.Void
typealias ErrorCharactersCompletion = (_ error: Error) -> Swift.Void

class CharactersBusiness{
    
    var provider: CharactersApiProtocol
    
    init() {
        provider = CharactersApiProvider()
    }
    
    func getCharacters(successCompletion: @escaping SuccessCharactersCompletion, errorCompletion: @escaping ErrorCharactersCompletion) {
        provider.fetchCharacters(success: { (data) in
            if let characters = try? JSONDecoder().decode(CharactersResponse.self, from: data!) {
                successCompletion(characters.people)
            }else{
                errorCompletion(BusinessError.parse("Could not parse characters response json"))
            }
            
        }) { (error) in
            errorCompletion(error)
        }
    }
}
