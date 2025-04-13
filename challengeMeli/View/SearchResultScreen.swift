//
//  SearchResultScreen.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//
import SwiftUI
import Kingfisher

struct SearchResultView: View {
    @EnvironmentObject var store: AppStore
    var body: some View {
        VStack {
            if !store.state.searchResultState.thereAreMorePages &&
               store.state.searchResultState.products.isEmpty {
                MessageView(message: .productsNotFound, type: .info).padding()
            } else {
                List {
                    ForEach(store.state.searchResultState.products, id:\.id) { product in
                        Button(action: {
                            store.dispatch(.navigation(.navigateTo(.productDetail(product))))
                        }) {
                            ProductItemList(product)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    if store.state.searchResultState.isLoading {
                        HStack {
                            Spacer()
                            ProgressView().id(UUID())
                            Spacer()
                        }
                    }
                }.accessibilityIdentifier(.tagSearchResulScreen)
            }
            if  !store.state.searchResultState.isLoading,
                let error = store.state.searchResultState.searchError {
                ErrorView(error: error) {
                    store.dispatch(.retryRequetFechProducts)
                }
            }
        }
        .runOnceOnAppear {
            store.dispatch(.requestFetchProducts)
        }.onDisappear {
            store.dispatch(.cancelFetchProducts)
        }
    }
}


struct ProductItemList: View {
    @EnvironmentObject var store: AppStore
    let product: ProductViewModel
    
    init(_ product: ProductViewModel) {
        self.product = product
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            RemoteImageView(url: product.thumbnail)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            
            
            VStack(alignment: .leading, spacing: 8) {
                if let brand = product.brand {
                    Text(brand)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    if let price = product.price {
                        Text(price) 
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    
                    if let originalPrice = product.originalPrice {
                        Text(originalPrice)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .strikethrough()
                    }
                }
            }
            Spacer()
        }
        .padding(.vertical, 8)
        .onAppear {
            if product == store.state.searchResultState.products.last {
                store.dispatch(.requestFetchProducts)
            }
        }
    }
}
