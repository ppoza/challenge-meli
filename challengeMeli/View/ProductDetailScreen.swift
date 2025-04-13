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
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if let pictures = store.state.searchResultState.productDetailState.productDescription?.pictures,
                       !pictures.isEmpty {
                        TabView {
                            ForEach(pictures, id: \.id) { picture in
                                RemoteImageView(url: picture.url)
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
                        RemoteImageView(url: product.thumbnail)
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
                        
                        Divider()
                        if let productDescription = store.state.searchResultState.productDetailState.productDescription {
                            if let pickers = productDescription.pickers {
                                
                                Spacer()
                                PickersView(pickers: pickers) { productId in
                                    store.dispatch(.fetchProductDescription(productId))
                                }
                            }
                            
                            if let buyBoxWinner = productDescription.buyBoxWinner {
                                BuyBoxWinnerView(buyBoxWinner: buyBoxWinner)
                            }
                            
                            if let description = productDescription.description,
                               !description.isEmpty {
                                Divider()
                                Text(.description)
                                    .font(.title2)
                                    .bold()
                                Text(description)
                            }
                            Spacer()
                            
                            if productDescription.pickers?.isEmpty ?? true {
                                MessageView(message: .unavaliableProductToSell, type: .warning)
                            } else {
                                Button(action: {
                                }) {
                                    Text(.sellThisProduct)
                                        .font(.headline)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            if store.state.searchResultState.productDetailState.isLoading {
                ActivityIndicatorView()
            }
        }
        .runOnceOnAppear {
            store.dispatch(.fetchProductDescription(product.id))
            store.dispatch(.fetchProductPictures)
        }
    }
}


