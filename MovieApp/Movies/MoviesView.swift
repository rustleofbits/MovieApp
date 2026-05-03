//
//  MoviesView.swift
//  MovieApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import SwiftUI

struct MoviesView: View {
    let movieDetails: [MovieDetails]
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Popular movies")
                .font(.largeTitle)
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(movieDetails) { movie in
                    MovieCell(
                        title: movie.title,
                        genres: getGenresString(genres: movie.genres)
                    )
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
    
    func getGenresString(genres: [String]) -> String {
        return genres.joined(separator: " | ")
    }
}

#Preview {
    MoviesView(
        movieDetails: [
            MovieDetails(
                id: "1",
                title: "Mario",
                genres: ["comedy", "cartoon"],
                rating: "5.9"
            ),
            MovieDetails(
                id: "2",
                title: "Apex",
                genres: ["horror", "drama"],
                rating: "6.1"
            ),
            MovieDetails(
                id: "3",
                title: "Soul",
                genres: ["drama", "documentary"],
                rating: "9.0"
            )
        ]
    )
}

struct MovieDetails: Identifiable {
    let id: String
    let title: String
    let genres: [String]
    let rating: String
}
