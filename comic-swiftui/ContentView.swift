//
//  ContentView.swift
//  comic-swiftui
//
//  Created by Lova on 2021/3/14.
//

import Combine
import Kingfisher
import SwiftUI

class BaggedModel: ObservableObject {
    var bag = Set<AnyCancellable>()
}

struct ContentView: View {
    @StateObject var model = ViewModel()

    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal) {
                ScrollViewReader { _ in
                    LazyHStack {
                        Text("hihihih ihi")

                        Text("hihihihihi")

                        Text("hihihihihi")
                        Text("hihihihihi")
                        Text("hihihihihi")
                        Text("hihihihihi")
                        Text("hihihihihi")
                        Text("hihihihihi")
                        Spacer().frame(width: 20)
                    }
                }
            }
            .frame(height: 44)
            .background(Color.gray)

            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(self.model.catalogs) { catalog in
                        CatalogItemView(catalog: catalog)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(4)
        }.onAppear {
            self.model.load()
        }
    }
}

extension ContentView {
    class ViewModel: BaggedModel {
        @Published var categories: [String] = []
        @Published var catalogs: [API.Catalog] = []

        func load() {
            api.catalog()
                .assign(to: \.catalogs, on: self)
                .store(in: &bag)

            api.category()
                .assign(to: \.categories, on: self)
                .store(in: &bag)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
