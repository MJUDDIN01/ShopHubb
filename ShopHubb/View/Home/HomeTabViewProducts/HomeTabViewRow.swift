//
//  HomeTabViewRow.swift
//  ShopHubb
//
//  Created by Jasim Uddin on 25/10/2023.
//

import SwiftUI

struct HomeTabViewRow: View {
    let product: Products
    
    var body: some View {
        HStack {
            // Mark:- Thumbnail image as circle image
            AsyncImage(url: product.thumbNailUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.orange)
            } placeholder: {
                Circle()
                    .frame(width: 32, height: 32)
                    .background(Color(.systemGray5))
            }
            // Mark:- Product info
            VStack(alignment: .leading, spacing: 4) {
                Text(product.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text(product.brand.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            // Mark:- Product price info
            VStack(alignment: .trailing, spacing: 4) {
                Text("\(product.price.toCurrency())")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text("\(product.discountPercentage.toPercentString())")
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor(product.discountPercentage > 0 ? .red : .green)
            }
            .padding(.leading, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

