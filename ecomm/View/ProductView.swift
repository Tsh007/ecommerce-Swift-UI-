//
//  ProductView.swift
//  ecomm
//
//  Created by Tejash Singh on 12/04/24.
//

import SwiftUI

struct ProductView: View {
    
    @StateObject var cartManager = CartManager()
    
    let viewModel = ProductViewModel()
    @State var products = [Product]()
    @State var searchTerm = ""
    var filteredProducts: [Product]{
        guard !searchTerm.isEmpty else { return products}
        return products.filter{ $0.title.localizedCaseInsensitiveContains(searchTerm) }
        //$0 just iterates over all products
    }
    
//    viewModel.products.enumerated()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(filteredProducts.enumerated()), id: \.element.id) { index, product in
                    NavigationLink {
                        ProductDetailView(products: viewModel.products, index: index).environmentObject(cartManager)
                    } label: {
                        ProductRowView(product: product).environmentObject(cartManager)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Products")
        }
        .searchable(text: $searchTerm, prompt: "Search Products")
        .task {
            await viewModel.fetchProducts()
            products = viewModel.products
        }
    }
}

//#Preview {
//    ProductView()
//}
