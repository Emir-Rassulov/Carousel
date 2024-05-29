//
//  Product.swift
//  Carousel
//
//  Created by Emir Rassulov on 27/05/2024.
//

import SwiftUI

struct Page: Identifiable, Hashable {
    var id: UUID = .init()
    var color: Color
    var product: Product

    static func == (lhs: Page, rhs: Page) -> Bool {
        return lhs.id == rhs.id && lhs.color == rhs.color && lhs.product.id == rhs.product.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(color)
        hasher.combine(product.id)
    }
}

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    var description: String
    var category: String
    var specifications: String
}

var productList = [
    Product(name: "Orange sweater", image: "sweater_1", price: 54, description: "Description 1", category: "Cardigan", specifications: "Specifications 1"),
    Product(name: "Red wine sweater", image: "sweater_2", price: 89, description: "Description 2", category: "Pullover", specifications: "Specifications 2"),
    Product(name: "Sand sweater", image: "sweater_3", price: 79, description: "Description 3", category: "Sweater vest", specifications: "Specifications 3"),
    Product(name: "Sea sweater", image: "sweater_4", price: 94, description: "Description 4", category: "Crew neck", specifications: "Specifications 4"),
    Product(name: "Cream sweater", image: "sweater_5", price: 99, description: "Description 5", category: "Turtleneck", specifications: "Specifications 5"),
    Product(name: "Beige sweater", image: "sweater_6", price: 65, description: "Description 6", category: "Pullover", specifications: "Specifications 6"),
    Product(name: "Grey sweater", image: "sweater_7", price: 54, description: "Description 7", category: "Cardigan", specifications: "Specifications 7"),
    Product(name: "Mink sweater", image: "sweater_8", price: 83, description: "Description 8", category: "Jumper", specifications: "Specifications 8")
]
