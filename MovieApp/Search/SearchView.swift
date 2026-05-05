//
//  SearchView.swift
//  MovieApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchVM()
    @State var searchText = ""
    
    var body: some View {
        List {
            ForEach(viewModel.movies) { movie in
                NavigationLink(destination: MovieDetailView(movieDetails: movie)) {
                    MovieSearchCell(movie: movie)
                }
                .buttonStyle(.plain)
            }
        }
        .searchable(text: $searchText, prompt: "Search for movies")
        .onChange(of: searchText) { _, newValue in
            Task {
                await viewModel.search(queryStr: newValue)
            }
        }
    }
}
