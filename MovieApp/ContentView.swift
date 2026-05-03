//
//  ContentView.swift
//  MovieApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            MoviesView(viewModel: MoviesVM())
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: SearchView()) {
                    Image(systemName: "magnifyingglass")
                }
            }
        }
        .navigationTitle("MoviesApp")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
