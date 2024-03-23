//
//  WidgetPokemon.swift
//  WidgetPokemon
//
//  Created by Onur Altintas on 24.03.2024.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    @AppStorage("pokemon", store: UserDefaults(suiteName: "group.onuraltintas.PokemonWidget"))
    var pokemonData: Data = Data()
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), pokemon: pikachu)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        if let pokemon = try? JSONDecoder().decode(PokemonModel.self, from: pokemonData) {
            return SimpleEntry(date: Date(), configuration: configuration, pokemon: pokemon)
        }
        return SimpleEntry(date: Date(), configuration: configuration, pokemon: pikachu)

    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        if let pokemon = try? JSONDecoder().decode(PokemonModel.self, from: pokemonData) {
            entries.append(SimpleEntry(date: Date(), configuration: configuration, pokemon: pokemon))
        }
        return Timeline(entries: entries, policy: .atEnd)
        
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let pokemon: PokemonModel
}

struct WidgetPokemonEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        PokemonImageView(pokemon: entry.pokemon)
    }
}

struct WidgetPokemon: Widget {
    let kind: String = "WidgetPokemon"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WidgetPokemonEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}
 


