//
//  newProductRow.swift
//  ecomm
//
//  Created by Tejash Singh on 12/04/24.
//

import SwiftUI

struct newProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        HStack(spacing: 20) {
            if let url = URL(string: product.image) {
                productImage(url: url)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.title.prefix(20))
                    .bold()
                
                Text("₹\(product.price)")
            }
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func productImage(url: URL) -> some View {
        AsyncImage(url: url) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .frame(width: 50)
        } placeholder: {
            ProgressView()
        }
        
    }
    
}

//#Preview {
//    newProductRow()
//}
