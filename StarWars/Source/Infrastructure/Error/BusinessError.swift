//
//  BusinessError.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 09/04/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

enum BusinessError: Error {
    case parse(String)
    case invalidValue
    case offlineMode
}
