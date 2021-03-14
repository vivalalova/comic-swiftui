//
//  CatalogItemView.swift
//  comic-swiftui
//
//  Created by Lova on 2021/3/14.
//

import Kingfisher
import SwiftUI

struct CatalogItemView: View {
    var catalog: API.Catalog

    var body: some View {
        VStack {
            VStack {
                KFImage(catalog.thumbnail?.url)
                    .frame(height: 88)
                    .frame(maxWidth: .infinity)
                    .padding(4)

                Text(catalog.title ?? "")
                    .font(.title3)
                    .bold()

                Text(catalog.welcomeDescription ?? "")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }.padding(8)
        }

        .background(Color.white)
        .clipped()
        .cornerRadius(4)
        .shadow(radius: 2)
    }
}

struct CatalogItemView_Previews: PreviewProvider {
    static let catalog = API.Catalog(id: "", title: "a", author: nil, category: nil, welcomeDescription: "b", url: nil, thumbnail: "", updatedAt: nil, createdAt: nil, hot: nil)

    static var previews: some View {
        CatalogItemView(catalog: catalog)
    }
}
