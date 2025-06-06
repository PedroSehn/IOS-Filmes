//
//  popularMoviesViewModel.swift
//  ios-requests
//
//  Created by aluno-03 on 04/06/25.
//

import SwiftUI

@MainActor
class PopularMoviesViewModel: ObservableObject{
    @Published var popularMovies: [Movie]?
    
    let bearerToken =     "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZDk1YzAyODY1MDY1YmIyOTQ2NjUxNTI0YzUxNGJmMiIsIm5iZiI6MTc0OTA0MTEyOC41NjYwMDAyLCJzdWIiOiI2ODQwM2ZlODlkMTY5M2RlMjM3ZjUwYjEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.LInX_L5KfyJz3vCKaTdFVCOEtDW4BKPovkCoHZSuYVU"
    
    func fetchData() async {
        self.popularMovies = try? await getPopularMovies()
    }
    
    private func getPopularMovies() async throws -> [Movie]?{
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1") else { return nil }
        var request = URLRequest(url: url)
        request.setValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let fetchedData = try JSONDecoder().decode(popularMoviesReponse.self, from: data)
        return fetchedData.results
    }
}
