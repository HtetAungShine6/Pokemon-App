//
//  PokemonListView.swift
//  Pokemon
//
//  Created by Akito Daiki on 8/7/2566 BE.
//

import SwiftUI
import Kingfisher

struct PokemonListView: View {
    @ObservedObject var viewModel = PokemonViewModel()
    @State private var searchText = ""
    @State private var selectedPokemon: Pokemon?
    
    var filteredPokemon: [Pokemon] {
        if searchText.isEmpty {
            return viewModel.pokemon
        } else {
            return viewModel.pokemon.filter { $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var groupedPokemon: [String: [Pokemon]] {
        Dictionary(grouping: filteredPokemon) { $0.type.capitalized }
    }
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.2), Color.pink
                .opacity(0.3)]), startPoint: .center, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                SearchBar(searchText: $searchText)
                
                List {
                    ForEach(groupedPokemon.keys.sorted(), id: \.self) { type in
                        Section(header: Text(type)) {
                            ForEach(groupedPokemon[type]!, id: \.id) { pokemon in
                                Button(action: {
                                    selectedPokemon = pokemon
                                }) {
                                    HStack {
                                        KFImage(URL(string: pokemon.imageUrl))
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .cornerRadius(8)
                                        
                                        VStack(alignment: .leading) {
                                            Text(pokemon.name.capitalized)
                                                .font(.headline)
                                            Text(pokemon.type.capitalized)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .padding(.vertical, 8)
                                }
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .sheet(item: $selectedPokemon) { pokemon in
                    PokemonDetailView(viewModel: viewModel, pokemon: pokemon)
                }
            }
        }
        .navigationBarTitle("Pokemon List")
        .onAppear {
            viewModel.fetchData()
        }
    }
}




struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
