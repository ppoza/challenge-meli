//
//  MainScreenView.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import SwiftUI
import Kingfisher

struct MainScreenView: View {
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        NavigationStack(path: store.binding(
            for: \.homeRouteStack,
            action: { .navigation(.updateNavigationPath($0)) }
        )) {
            NavigationView {
                SearchScreenScreen()              
            }
            .navigationDestination(for: Route.self) { destination in
                switch destination {
                case .searchResult:
                    SearchResultView()
                case .productDetail(let product):
                    ProductDetailScreen(product: product)                        
                default:
                    Text(LocalizedStringKey.routeNotFound)
                }
            }
            .navigationBarBackButtonHidden()
            .navigationTitle(LocalizedStringKey.searcher)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}



#Preview {
    MainScreenView()
}
