//
//  MovieCell.swift
//  MovieApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import SwiftUI

struct MovieCell: View {
    let title: String
    let genres: String
    let rating: String
    let posterUrl: String
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: posterUrl)) { res in
                switch res {
                case .empty:
                    SkeletonView(height: 250)
                case .success(let image):
                    ImageView(image: image, rating: rating)
                case .failure:
                    SkeletonView(height: 250)
                @unknown default:
                    SkeletonView(height: 250)
                }
            }
            Text(title)
            Text(genres)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .multilineTextAlignment(.leading)
    }
}

#Preview {
    MovieCell(title: "Mario", genres: "comedy | cartoon", rating: "5.9", posterUrl: "https://image.tmdb.org/t/p/w500/eTp7gSPkSF3Aw79mNx1NkBP1PZT.jpg")
}
