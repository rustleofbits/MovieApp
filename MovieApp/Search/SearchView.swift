//
//  SearchView.swift
//  MovieApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import SwiftUI
import Combine

struct SearchView: View {
    @StateObject var viewModel = SearchVM()
    @State var searchText = ""
    @State var searchTask: Task<Void, Never>? = nil
    
    var body: some View {
        VStack {
            if let errorMessage = viewModel.error {
                Text("Something went wrong")
                    .font(.title)
                Text(errorMessage)
            } else {
                List {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movieDetails: movie)) {
                            MovieSearchCell(movie: movie)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search for movies")
        .onChange(of: searchText) { _, newValue in
            searchTask?.cancel()
            searchTask = Task {
                await viewModel.search(queryStr: newValue)
            }
        }
        .onAppear() {
            Task {
                await viewModel.fetchGenres()
            }
        }
    }
}
