//
//  File.swift
//  Pokemon
//
//  Created by Akito Daiki on 27/6/2566 BE.
//

import Foundation

struct Pokemon : Decodable, Identifiable{
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let weight: Int
    let height: Int
    let attack: Int
    let defense: Int
    let description: String
    
}
