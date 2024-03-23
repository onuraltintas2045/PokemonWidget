//
//  PokemonModel.swift
//  PokemonWidget
//
//  Created by Onur Altintas on 23.03.2024.
//

import Foundation
import SwiftUI


struct PokemonModel: Identifiable, Codable {
    var id =  UUID()
    let name: String
    let type: String
    let species: String
    let abilities: String
    let image: String
    let colorName: String
}



let bulbasaur: PokemonModel = PokemonModel(name: "Bulbasaur", type: "Grass, Posion", species: "Seed Pokemon", abilities: "Overgrow, Chlorophyll", image: "bullbasaur", colorName: "green")
let pikachu: PokemonModel = PokemonModel(name: "Pikachu", type: "Electric", species: "Mouse Pokemon", abilities: "Static, Lightning Rod", image: "pikachu", colorName: "yellow")
let eevee: PokemonModel = PokemonModel(name: "Eevee", type: "Normal", species: "Evolution Pokemon", abilities: "Run away, Adaptability, Anticipation", image: "eevee", colorName: "brown")

let pokemonList: [PokemonModel] = [pikachu, bulbasaur, eevee]


extension PokemonModel {
    var color: Color{
        switch colorName {
        case "green" :
            return .green
        case "yellow":
            return .yellow
        case "brown":
            return .brown
        default :
            return .black
        }
    }
}
