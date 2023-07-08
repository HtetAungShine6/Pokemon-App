//
//  MainView.swift
//  Pokemon
//
//  Created by Akito Daiki on 8/7/2566 BE.
//

import SwiftUI

struct MainView: View {
    @StateObject var pokemonViewModel = PokemonViewModel()
    @State private var searchText = ""
    var filteredPokemon: [Pokemon] {
        if searchText.isEmpty {
            return pokemonViewModel.pokemon
        } else {
            return pokemonViewModel.pokemon.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    var body: some View {
        VStack{
            TabView{
                PokemonGridView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                PokemonListView()
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                ThemeView()
                    .tabItem{
                        Image(systemName: "gearshape")
                        Text("Setting")
                    }
            }
            .onAppear {
                        pokemonViewModel.fetchData()
                    }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
