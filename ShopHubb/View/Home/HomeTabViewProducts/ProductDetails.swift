//
//  ProductDetails.swift
//  ShopHubb
//
//  Created by Jasim Uddin on 25/10/2023.
//

import SwiftUI

struct ProductDetails: View {
    let product: Products
    var body: some View {
        HStack {
            HStack {
                // Mark:- Load image in full
                AsyncImage(url: product.thumbNailUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width-30, height: 140)
                        .foregroundColor(Color.orange)
                    HStack {
                        Text("Price:").bold()
                        Text("\(product.price.toCurrency())")
                            .bold()
                    }
                } placeholder: {
                    Text("Thumbnail")
                        .frame(width: 32, height: 32)
                        .background(Color(.systemGray5))
                }
            }
            .padding()
        }
        VStack(alignment: .leading) {
            HStack {
                Text("Category:")
                    .bold()
                Text(product.category)
            }
            .padding(2)
            VStack(alignment: .leading) {
                Text("Description: ")
                    .bold()
                Text(product.description)
            }
            .padding(2)
            HStack {
                Text("Stock:").bold()
                Text("\(product.stock)")
            }
            HStack {
                Text("Rating:")
                    .bold()
                Text("\(product.rating)")
            }
            .padding(2)
            HStack {
                Text("Discount:")
                    .bold()
                Text("\(product.discountPercentage.toPercentString())")
                    .foregroundColor(product.discountPercentage > 0 ? .red : .green)
            }
            
            Spacer()
                .navigationBarTitle(product.title, displayMode: .inline)
        }
        .padding()
    }
}
