//
//  CartManager.swift
//  ecomm
//
//  Created by Tejash Singh on 12/04/24.
//

import Foundation


class CartManager: ObservableObject {
    @Published private(set) var products = [Product]()
    @Published private(set) var total: Double = 0.0
    
    func addToCart(product: Product){
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Product){
        products = products.filter{ $0.id != product.id}
        total -= product.price
    }
}
