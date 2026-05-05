//
//  MovieSearchCell.swift
//  MovieApp
//
//  Created by Dinara Shadyarova on 05.05.2026.
//

import SwiftUI

struct MovieSearchCell: View {
    let movie: MovieDetails
    
    var body: some View {
        HStack(spacing: 10) {
            AsyncImage(url: URL(string: movie.posterUrl ?? "")) { phase in
                switch phase {
                case .empty, .failure:
                    SkeletonView(width: 80, height: 120)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, alignment: .leading)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay() {
                            DimmedBackgroundWithRating(cornerRadius: 10, opacityStart: 0.7)
                        }
                @unknown default:
                    SkeletonView(width: 80, height: 120)
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                Text(movie.genres.joined(separator: " | "))
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(movie.rating)
                .foregroundStyle(Color(hex: "118214"))
                .bold()
        }
        .padding([.trailing], 10)
    }
}
