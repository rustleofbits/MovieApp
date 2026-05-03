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
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("Mario")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    ZStack(alignment: .topLeading) {
                        LinearGradient(
                            colors: [.black.opacity(0.7), .clear],
                            startPoint: .top,
                            endPoint: .center
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        Text(rating)
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(hex: "169C1B"))
                            )
                            .padding([.top, .leading], 10)
                            .foregroundStyle(.white)
                            .bold()
                            .font(.caption)
                            
                    }
                )
            Text(title)
            Text(genres)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    MovieCell(title: "Mario", genres: "comedy | cartoon", rating: "5.9")
}
