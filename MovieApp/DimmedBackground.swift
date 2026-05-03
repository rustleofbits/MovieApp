//
//  DimmedBackgroundWithRating.swift
//  MovieApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import SwiftUI

struct DimmedBackgroundWithRating: View {
    var rating: String? = nil
    let cornerRadius: CGFloat
    let opacityStart: Double
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            LinearGradient(
                colors: [.black.opacity(opacityStart), .clear],
                startPoint: .top,
                endPoint: .center
            )
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            if let rating {
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
        }
    }
}
