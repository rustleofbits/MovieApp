//
//  MoviesVM.swift
//  MovieApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import Combine
import Foundation

class MoviesVM: ObservableObject {
    @Published var movieDetails: [MovieDetails] = []
    private let urlString = "https://api.themoviedb.org/3/movie/popular"
    private let genresUrlString = "https://api.themoviedb.org/3/genre/movie/list"
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
    @Published var error: String?
    
    func fetchMovies() async {
        error = nil
        let allGenres = await fetchGenres()
        guard var url = URL(string: urlString) else { return }
        url.append(queryItems: [URLQueryItem(name: "api_key", value: apiKey)])
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(ResponseApi.self, from: data)
            movieDetails = decoded.results.toModel(allGenres: allGenres)
        } catch {
            self.error = error.localizedDescription
        }
    }
    
    func fetchGenres() async -> [Genre] {
        guard var url = URL(string: genresUrlString) else { return [] }
        url.append(queryItems: [URLQueryItem(name: "api_key", value: apiKey)])
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(GenreResponse.self, from: data)
            return decoded.toModel()
        } catch {
            return []
        }
    }
}
