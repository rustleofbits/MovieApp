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
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
    
    func fetchMovies() async {
        guard var url = URL(string: urlString) else { return }
        url.append(queryItems: [URLQueryItem(name: "api_key", value: apiKey)])
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(ResponseApi.self, from: data)
            movieDetails = decoded.results.toModel()
        } catch {
            
        }
    }
}
