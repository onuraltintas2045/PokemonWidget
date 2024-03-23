//
//  WidgetPokemonBundle.swift
//  WidgetPokemon
//
//  Created by Onur Altintas on 24.03.2024.
//

import WidgetKit
import SwiftUI

@main
struct WidgetPokemonBundle: WidgetBundle {
    var body: some Widget {
        WidgetPokemon()
        WidgetPokemonLiveActivity()
    }
}
