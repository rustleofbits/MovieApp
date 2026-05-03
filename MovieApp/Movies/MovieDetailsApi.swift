//
//  MovieDetailsApi.swift
//  MovieApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import Foundation

struct ResponseApi: Decodable {
    let results: [MovieDetailsApi]
}

struct MovieDetailsApi: Decodable {
    let title: String
    let id: Int
    let genre_ids: [Int]
    let vote_average: Double
    let poster_path: String
    
    func toModel() -> MovieDetails {
        MovieDetails(
            id: String(id),
            title: title,
            genreIds: genre_ids.map { String($0) },
            rating: String(format: "%.1f", vote_average),
            posterUrl: "https://image.tmdb.org/t/p/w500\(poster_path)"
        )
    }
}

extension Array where Element == MovieDetailsApi {
    func toModel() -> [MovieDetails] {
        map { movieApi in
            movieApi.toModel()
        }
    }
}
//{
//           "adult": false,
//           "backdrop_path": "/p8777bPIlyFYcjqP2hU8htoz1RG.jpg",
//           "genre_ids": [
//               28,
//               53
//           ],
//           "id": 1318447,
//           "title": "Apex",
//           "original_language": "en",
//           "original_title": "Apex",
//           "overview": "A grieving woman pushing her limits on a solo adventure in the Australian wild is ensnared in a twisted game with a cunning killer who thinks she's prey.",
//           "popularity": 520.2524,
//           "poster_path": "/eTp7gSPkSF3Aw79mNx1NkBP1PZT.jpg",
//           "release_date": "2026-04-24",
//           "softcore": false,
//           "video": false,
//           "vote_average": 6.484,
//           "vote_count": 584
//       },
