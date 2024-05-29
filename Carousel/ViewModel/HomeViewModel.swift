//
//  HomeViewModel.swift
//  Carousel
//
//  Created by Emir Rassulov on 27/05/2024.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var currentPage: String = ""
    @Published var listOfPages: [Page] = []
    @Published var fakedPages: [Page] = []

    private var cancellable: AnyCancellable?

    init() {
        setupPages()
        createCarousel(setFirstPageAsCurrentPage: true)

        // Timer to advance the page
        cancellable = Timer.publish(every: 3.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.advancePage()
            }
    }

    deinit {
        cancellable?.cancel()
    }

    private func setupPages() {
        for (index, product) in productList.enumerated() {
            listOfPages.append(Page(color: Color(index % 2 == 0 ? .red : .blue), product: product))
        }
    }

    // Change from private to internal (default) or fileprivate
    func createCarousel(setFirstPageAsCurrentPage: Bool = false) {
        fakedPages.removeAll()
        fakedPages.append(contentsOf: listOfPages)

        if var firstPage = listOfPages.first, var lastPage = listOfPages.last {
            if setFirstPageAsCurrentPage {
                currentPage = firstPage.id.uuidString
            }

            firstPage.id = .init()
            lastPage.id = .init()

            fakedPages.append(firstPage)
            fakedPages.insert(lastPage, at: 0)
        }
    }

    func fakeIndex(of page: Page) -> Int {
        return fakedPages.firstIndex(of: page) ?? 0
    }

    func originalIndex(for id: String) -> Int {
        return listOfPages.firstIndex { $0.id.uuidString == id } ?? 0
    }

    func advancePage() {
        if let currentIndex = fakedPages.firstIndex(where: { $0.id.uuidString == currentPage }) {
            let nextIndex = (currentIndex + 1) % fakedPages.count
            currentPage = fakedPages[nextIndex].id.uuidString
        }
    }

    func handlePageChange(newPage: String) {
        if newPage == fakedPages.first?.id.uuidString, let lastPage = listOfPages.last {
            DispatchQueue.main.async {
                self.currentPage = lastPage.id.uuidString
            }
        } else if newPage == fakedPages.last?.id.uuidString, let firstPage = listOfPages.first {
            DispatchQueue.main.async {
                self.currentPage = firstPage.id.uuidString
            }
        }
    }
}
