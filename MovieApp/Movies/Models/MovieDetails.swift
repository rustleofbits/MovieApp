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
    let genres: [String]
    let rating: String
    let posterUrl: String?
    let backdropUrl: String?
    let overview: String
}
