//
//  ContentView.swift
//  Carousel
//
//  Created by Emir Rassulov on 27/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Home()
                .navigationTitle("Carousel")
        }
    }
}

#Preview {
    ContentView()
}
