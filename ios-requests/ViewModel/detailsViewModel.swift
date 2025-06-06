//
//  detailsViewModel.swift
//  ios-requests
//
//  Created by aluno-03 on 05/06/25.
//

import SwiftUI

@MainActor
class DetailsViewModel: ObservableObject{
    @Published var movieDetails: MovieDetail?
    var movieID: Int
    
    let bearerToken =     "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZDk1YzAyODY1MDY1YmIyOTQ2NjUxNTI0YzUxNGJmMiIsIm5iZiI6MTc0OTA0MTEyOC41NjYwMDAyLCJzdWIiOiI2ODQwM2ZlODlkMTY5M2RlMjM3ZjUwYjEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.LInX_L5KfyJz3vCKaTdFVCOEtDW4BKPovkCoHZSuYVU"
    
    init(movieID: Int){
        self.movieID = movieID
    }
    
    func fetchData() async {
        self.movieDetails = try? await getMovieDetails()
    }
    
    private func getMovieDetails() async throws -> MovieDetail?{
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)?language=en-US") else { return nil }
        print(url)
        var request = URLRequest(url: url)
        request.setValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: request)
        let fetchedData = try JSONDecoder().decode(MovieDetail.self, from: data)
        return fetchedData
    }
}
