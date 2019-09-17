//
//  Pokemon.swift
//  Pokedex
//
//  Created by Lambda_School_Loaner_101 on 9/16/19.
//  Copyright © 2019 Ife Banire. All rights reserved.
//

import Foundation

struct Pokedex: Decodable {
    let id: Int
    let name: String
    let types: String
    let abilities: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case types
        case abilities
    }
}

struct PokedexSearch: Decodable {
        let results: [Pokedex]
}


