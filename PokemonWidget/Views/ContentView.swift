//
//  ContentView.swift
//  PokemonWidget
//
//  Created by Onur Altintas on 23.03.2024.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    @AppStorage("pokemon", store: UserDefaults(suiteName: "group.onuraltintas.PokemonWidget"))
    var pokemonData: Data = Data()
    var body: some View {
        ScrollView{
            VStack(spacing: 25){
                ForEach(pokemonList){ pokemon in
                    PokemonImageView(pokemon: pokemon).onTapGesture {
                        saveUserDefaults(pokemon: pokemon)
                    }
                }
            }
            .padding()
        }
        .scrollIndicators(.hidden)
        
    }
    
    func saveUserDefaults(pokemon: PokemonModel){
        if let pokeData = try? JSONEncoder().encode(pokemon) {
            self.pokemonData = pokeData
            WidgetCenter.shared.reloadTimelines(ofKind: "WidgetPokemon")
        }
    }
}

#Preview {
    ContentView()
}
