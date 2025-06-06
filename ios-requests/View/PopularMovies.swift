//
//  PopularMovies.swift
//  ios-requests
//
//  Created by aluno-03 on 05/06/25.
//

import SwiftUI

struct PopularMovies: View {
    @StateObject private var popularMovies = PopularMoviesViewModel()
    var showTitle: Bool = true
    var body: some View {
            VStack(alignment: .leading){
                if(showTitle){
                    Text("Poupar Movies").bold().font(.title2)                    
                }
                if let movies = popularMovies.popularMovies, !movies.isEmpty {
                    ForEach(popularMovies.popularMovies!, id: \.id) { movie in
                        PopularMovieCard(movie: movie)
                    }
                }
            }.task {
                await popularMovies.fetchData()
            }.padding()
    }
}

struct PopularMovieCard: View {
    let movie: Movie
    
    var body: some View {
        
            HStack(){
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(width: 83, height: 123)
                .cornerRadius(10)
                VStack(alignment: .leading){
                    HStack{
                        Text(movie.title).font(.headline).bold()
                        Spacer()
//                        Heart(movie: movie)
                    }
                    Text(movie.overview).lineLimit(3).foregroundStyle(.gray)
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text(String(format: "%.1f",movie.voteAverage)).foregroundStyle(.gray)
                    }
                    Divider()
                }
            }
            
        
    }
}
