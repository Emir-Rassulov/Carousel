//
//  Home.swift
//  Carousel
//
//  Created by Emir Rassulov on 27/05/2024.
//

import SwiftUI

struct Home: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size

            if viewModel.currentPage != "" {
                TabView(selection: $viewModel.currentPage) {
                    ForEach(viewModel.fakedPages) { page in
                        ProductCardView(product: page.product, size: CGSize(width: size.width * 0.8, height: size.height))
                            .tag(page.id.uuidString)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .overlay(alignment: .bottom) {
                    PageControl(totalPages: viewModel.listOfPages.count, currentPage: viewModel.originalIndex(for: viewModel.currentPage))
                        .offset(y: -15)
                }
                .onChange(of: viewModel.currentPage) { newPage in
                    viewModel.handlePageChange(newPage: newPage)
                }
                
                
            }
        }
        .frame(height: 400)
        .onAppear {
            guard viewModel.fakedPages.isEmpty else { return }
            viewModel.createCarousel(setFirstPageAsCurrentPage: true)
        }
    }
}

#Preview {
    Home()
}
