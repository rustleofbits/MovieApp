//
//  Genre.swift
//  MovieApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import Foundation

struct GenreResponse: Decodable {
    let genres: [GenreApi]
    
    struct GenreApi: Decodable {
        let id: Int
        let name: String
    }
    func toModel() -> [Genre] {
        genres.map { Genre(id: String($0.id), name: $0.name) }
    }
}

struct Genre {
    let id: String
    let name: String
}
