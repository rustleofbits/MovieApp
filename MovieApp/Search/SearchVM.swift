//
//  SearchVM.swift
//  MovieApp
//
//  Created by Dinara Shadyarova on 05.05.2026.
//

import Foundation
import Combine

class SearchVM: ObservableObject {
    @Published var movies: [MovieDetails] = []
    private let urlStr = "https://api.themoviedb.org/3/search/movie"
    private let genresUrlString = "https://api.themoviedb.org/3/genre/movie/list"
    private var genres: [Genre] = []
    
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func search(queryStr: String) async {
        guard var url = URL(string: urlStr) else { return }
        url.append(
            queryItems: [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "query", value: queryStr)
            ]
        )
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(ResponseApi.self, from: data)
            await MainActor.run {
                movies = decoded.results.toModel(allGenres: genres)
            }
        } catch {
            print("!!! ", error)
        }
    }
    
    func fetchGenres() async {
        guard var url = URL(string: genresUrlString) else { return }
        url.append(queryItems: [URLQueryItem(name: "api_key", value: apiKey)])
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(GenreResponse.self, from: data)
            genres = decoded.toModel()
        } catch {
        }
    }
}
