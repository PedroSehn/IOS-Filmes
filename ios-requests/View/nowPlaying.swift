//
//  nowPlaying.swift
//  ios-requests
//
//  Created by aluno-03 on 05/06/25.
//

import SwiftUI


struct NowPlaying: View{
    @StateObject private var nowPlayingViewModel = NowPlayingViewModel()
    @State var selectedMovie: Movie?
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Now Playing").bold().font(.title2) 
                    Spacer()
                    NavigationLink("See All", destination: AllMovies())
                }
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        if let movies = nowPlayingViewModel.nowPlayingMovies, !movies.isEmpty {
                            ForEach(nowPlayingViewModel.nowPlayingMovies!, id: \.id) { movie in
                                NowPlayingMovieCard(movie: movie).onTapGesture(){
                                    selectedMovie = movie
                                }.sheet(item: $selectedMovie){ movie in
                                    MovieDetails(movieID: movie.id)
                                }
                            }
                        }
                    }.task {
                        await nowPlayingViewModel.fetchData()
                    }
                    
                }
            }.padding()
                }
            }
        }



struct NowPlayingMovieCard: View{
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: 150, height: 225)
                        .cornerRadius(10)
            VStack(alignment: .leading){
                Text(movie.title).bold()
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .frame(width: 150, alignment: .leading)
                HStack(alignment: .firstTextBaseline){
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text(String(format: "%.1f",movie.voteAverage)).foregroundStyle(.gray)
                }
            }
        }
    }
}
