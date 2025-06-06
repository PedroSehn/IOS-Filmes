//
//  AllMovies.swift
//  ios-requests
//
//  Created by aluno-03 on 05/06/25.
//

import SwiftUI

struct AllMovies: View {
    var body: some View {
        ScrollView{
            PopularMovies(showTitle: false).navigationTitle("All Movies")
        }
    }
}
