//
//  ProductCardView.swift
//  Carousel
//
//  Created by Emir Rassulov on 27/05/2024.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product
    let size: CGSize

    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width * 0.8, height: size.height * 0.5)
                .cornerRadius(20.0)

            Text(product.name)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.black)

            HStack(spacing: 2) {
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }

                Spacer()

                Text("$\(product.price)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }

            Text(product.category)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 4)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        .frame(width: size.width * 0.8, height: size.height)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProduct = productList[0]
        return ProductCardView(product: sampleProduct, size: CGSize(width: 300, height: 400))
    }
}

import SwiftUI

struct PageControl: UIViewRepresentable {
    var totalPages: Int
    var currentPage: Int

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = totalPages
        control.currentPage = currentPage
        control.backgroundStyle = .prominent
        control.allowsContinuousInteraction = false
        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.numberOfPages = totalPages
        uiView.currentPage = currentPage
    }
}
