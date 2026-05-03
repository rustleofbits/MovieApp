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
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("Mario")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(title)
            Text(genres)
                .font(.caption)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    MovieCell(title: "Mario", genres: "comedy | cartoon")
}
