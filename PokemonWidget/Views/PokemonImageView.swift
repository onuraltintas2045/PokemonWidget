//
//  PokemonImageView.swift
//  PokemonWidget
//
//  Created by Onur Altintas on 23.03.2024.
//

import SwiftUI

struct PokemonImageView: View {
    var pokemon: PokemonModel
    var body: some View {
        VStack(spacing: 30) {
            Image(pokemon.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150,height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(pokemon.color, lineWidth: 4))
                .shadow(color: pokemon.color, radius: 10)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack{
                    Text("Name:")
                        .font(.title3)
                    Text(pokemon.name)
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                HStack{
                    Text("Type:")
                        .font(.title3)
                    Text(pokemon.type)
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(pokemon.color)
                }
                
                HStack{
                    Text("Species:")
                        .font(.title3)
                    Text(pokemon.species)
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                HStack{
                    Text("Abilities:")
                        .font(.title3)
                    Text(pokemon.abilities)
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                
            }
            
        }
        .padding()
    }
    
    
}

#Preview {
    PokemonImageView(pokemon: pikachu)
}
