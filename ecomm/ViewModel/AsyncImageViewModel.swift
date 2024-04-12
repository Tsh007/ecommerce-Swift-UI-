//
//  AsyncImageViewModel.swift
//  ecomm
//
//  Created by Tejash Singh on 12/04/24.
//

import SwiftUI

struct AsyncImageView: View {

    let imageURL: String?

    var body: some View {
        if let imageURL, let url = URL(string: imageURL) {
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
        }else {
            ProgressView()
        }
    }
}

#Preview {
    AsyncImageView(imageURL: Product.dummy.image)
}
