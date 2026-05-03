//
//  MovieDetails.swift
//  MovieApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import Foundation

struct MovieDetails: Identifiable {
    let id: String
    let title: String
    let genreIds: [String]
    let rating: String
    let posterUrl: String
}
