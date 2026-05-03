//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import SwiftUI

struct MovieDetailView: View {
    let movieDetails: MovieDetails
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: movieDetails.backdropUrl)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay(
                            DimmedBackgroundWithRating(rating: movieDetails.rating, cornerRadius: 0.0)
                        )
                case .empty, .failure:
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
            VStack(spacing: 30) {
                VStack {
                    Text(movieDetails.title)
                        .font(.title2)
                    Text(movieDetails.genres.joined(separator: " | "))
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                Text(movieDetails.overview)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    MovieDetailView(movieDetails: MovieDetails(id: "", title: "Test", genres: ["2", "4"], rating: "5.6", posterUrl: "", backdropUrl: "", overview: "djkndkjndkjndj"))
}
