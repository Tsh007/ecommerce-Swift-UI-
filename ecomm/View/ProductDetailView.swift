//
//  ProductDetailView.swift
//  ecomm
//
//  Created by Tejash Singh on 12/04/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    @EnvironmentObject var cartManager : CartManager
    
    var products: [Product] = []
    @State var index: Int
    
    @State var showCartView: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 16) {
                
                HStack {
                    
                    Spacer()
                    
                    AsyncImageView(imageURL: products[index].image)
                        .scaledToFit()
                        .frame(height: 300)
                    
                    Spacer()
                }
                
                
                Text(products[index].title)
                    .font(.headline)
                    .padding(.top)
                
                Text(products[index].description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)

                
                
                Spacer()
                
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Total Price")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Text(products[index].price.currencyFormat())
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.indigo)
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Image(systemName: "cart.fill.badge.plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .frame(width: 50, height: 50)
                            .background(.indigo)
                        
                        NavigationLink(destination: cartView().environmentObject(cartManager).onAppear{
                            cartManager.addToCart(product: products[index])
                        }, label: {
                            Text("Buy Now")
                                .font(.headline)
                                .fontWeight(.bold)
                                .frame(width: 100, height: 50)
                                .background(Color(UIColor.darkGray))
                        })
                        
                    }
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.trailing)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(.gray.opacity(0.2))
                .clipShape(.buttonBorder)
            }
            .padding()
        }
    }
    
}

//#Preview {
//    ProductDetailView()
//}

