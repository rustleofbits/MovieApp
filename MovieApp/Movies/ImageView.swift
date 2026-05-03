//
//  ImageView.swift
//  MovieApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import SwiftUI

struct ImageView: View {
    let image: Image
    let rating: String
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(height: 250)
            .overlay(
                DimmedBackgroundWithRating(rating: rating, cornerRadius: 10.0)
            )
    }
}
