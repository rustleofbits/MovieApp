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
    @Published var error: String?
    
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func search(queryStr: String) async {
        await MainActor.run {
            self.error = nil
        }
        guard !queryStr.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
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
                if movies.isEmpty {
                    self.error = "No movies"
                } else {
                    self.error = nil
                }
            }
        } catch is CancellationError {
        } catch let urlError as URLError where urlError.code == .cancelled {
        } catch {
            await MainActor.run {
                self.error = error.localizedDescription
            }
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
