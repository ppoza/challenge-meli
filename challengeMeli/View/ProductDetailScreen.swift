//
//  ProductDetailView.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import SwiftUI

struct ProductDetailScreen: View {
    
    let product: ProductViewModel
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let pictures = store.state.searchResultState.productDetailState.productPictures?.pictures,
                   !pictures.isEmpty {
                        TabView {
                            ForEach(pictures, id: \.id) { picture in
                                RemoteImageView(urlString: picture.url)
                                    .frame(height: 300)
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(12)
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.horizontal, 20)
                        .frame(height: 300)
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))         
                } else {
                     RemoteImageView(urlString: product.thumbnail)
                         .frame(height: 300)
                         .frame(maxWidth: .infinity)
                         .cornerRadius(12)
                         .padding(.horizontal)
                }
                
            
                VStack(alignment: .leading, spacing: 8) {
                    
                    if let brand = product.brand {
                        Text(brand)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                                
                    Text(product.title)
                        .font(.title)
                        .fontWeight(.bold)
                        
                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        if let price = product.price {
                            Text(price)
                                .font(.title2)
                                .foregroundColor(.blue)
                        }
                        
                        if let originalPrice = product.originalPrice {
                            Text(originalPrice)
                                .font(.title3)
                                .foregroundColor(.gray)
                                .strikethrough()
                        }
                    }
                    
                    if let productDescription = store.state.searchResultState.productDetailState.productDescription {
                        Spacer()
                        Text(productDescription.plainText)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                    }) {
                        Text(LocalizedStringKey.buyNow)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
        }
        .runOnceOnAppear {
            store.dispatch(.fetchProductDescription)
            store.dispatch(.fetchProductPictures)
        }
    }
}
