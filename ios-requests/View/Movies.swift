//
//  Movies.swift
//  ios-requests
//
//  Created by aluno-03 on 05/06/25.
//

import SwiftUI

struct Movies: View{
    var body: some View{
        NavigationStack {
            ScrollView(){
                NowPlaying()
                Divider()
                PopularMovies()
            }
        }
    }
}
