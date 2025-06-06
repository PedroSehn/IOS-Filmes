//
//  ContentView.swift
//  ios-requests
//
//  Created by aluno-03 on 04/06/25.
//

import SwiftUI

struct ContentView: View {
//    @StateObject private var nowPlayingViewModel = NowPlayingViewModel()
    @StateObject private var popularMoviesModel = PopularMoviesViewModel()
    
    
    var body: some View {
        VStack{
            Movies()
        }
    }
}

