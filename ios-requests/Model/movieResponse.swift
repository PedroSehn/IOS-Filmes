	//
//  movieResponse.swift
//  ios-requests
//
//  Created by aluno-03 on 04/06/25.
//

struct Dates: Codable, Hashable {
    let maximum: String
    let minimum: String
}

struct Movie: Decodable, Hashable, Identifiable {
    let adult: Bool
        let backdropPath: String
        let genreIds: [Int]
        let id: Int
        let originalLanguage: String
        let originalTitle: String
        let overview: String
        let popularity: Double
        let posterPath: String
        let releaseDate: String
        let title: String
        let video: Bool
        let voteAverage: Double
        let voteCount: Int

        enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath = "backdrop_path"
            case genreIds = "genre_ids"
            case id
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview
            case popularity
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title
            case video
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }

struct popularMoviesReponse: Decodable{
    let page: Int
    let results: [Movie]
}

struct nowPlayingResponse: Decodable{
    let dates: Dates
    let page: Int
    let results: [Movie]
}
