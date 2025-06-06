//
//  MovieDetails.swift
//  ios-requests
//
//  Created by aluno-03 on 05/06/25.
//

import SwiftUI

struct MovieDetails: View {
    var movieID: Int
    @StateObject private var movieDetais: DetailsViewModel
    init(movieID: Int){
        self.movieID = movieID
        _movieDetais = StateObject(wrappedValue: DetailsViewModel(movieID: movieID))
    }
    
    var body: some View {
        ScrollView(){
            VStack{
                HStack{
                    Spacer()
                    Text("Movie Details").bold()
                    Spacer()
//                    Heart(movie: movie, isGray: false)
                }.padding()
                Divider()
            }
            if let movie = movieDetais.movieDetails {
                VStack{
                    HStack{
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
                            Spacer()
                            Spacer()
                            Text(movie.title).font(.headline).bold()
                            HStack{
                                ForEach(movie.genres, id: \.id){ genre in
                                    Text("\(genre.name)").foregroundStyle(.gray)
                                }
                            }
                            
                            Spacer()
                            HStack{
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                Text(String(5.8)).foregroundStyle(.gray)
                            }
                        }.padding()
                        
                    }
                    VStack(alignment: .leading){
                        Text("Overview").bold()
                        Text(movie.overview).foregroundStyle(.gray)
                    }.padding()
                }
            }
            
        }.task {
            await movieDetais.fetchData()
        }
    }
}
