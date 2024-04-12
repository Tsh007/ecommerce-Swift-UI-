//
//  cartView.swift
//  ecomm
//
//  Created by Tejash Singh on 12/04/24.
//

import SwiftUI

struct cartView: View {
    @EnvironmentObject var cartManager:CartManager
    
    var body: some View {
        
        VStack {
            
            if cartManager.products.count > 0 {
                
                ForEach(cartManager.products,id: \.id){
                    product in newProductRow(product: product)
                }
                
                HStack{
                    Text("Your cart total is")
                    Spacer()
                    Text("₹\(Int(cartManager.total))").bold()
                }
                .padding()
                
            }else{
                Text("Your Cart is Empty")
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

//#Preview {
//    cartView()
//}
