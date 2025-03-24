//
//  SearchScreenView.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import SwiftUI

struct SearchScreenScreen: View {
    @EnvironmentObject var store: AppStore

    
    var searchText: String {
        store.state.searchState.query
    }

    var isValidQuery: Bool {
        store.state.searchState.isValidQuery
    }

    
    var body: some View {
        VStack {
            SearchBar(text: Binding(
                get: { searchText },
                set: { store.dispatch(.updateSearchText($0)) } // Dispatch on text change
            ), isEnabled: isValidQuery, helpText: LocalizedStringKey.helpSearchText, accessibilityIdentifier: .tagSearchButton , onSearch: {
                store.dispatch(.navigation(.navigateTo(.searchResult(query: searchText))))
            })
            .padding(16)
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    var isEnabled: Bool
    var helpText: LocalizedStringKey
    var accessibilityIdentifier: String? = nil
    var onSearch: () -> Void

    var body: some View {
        VStack {
            HStack {
                TextField(LocalizedStringKey.searchHint, text: $text, onCommit: onSearch)
                    .textFieldThemed().accessibilityIdentifier(.tagSearchInput)
                
                Button(action: onSearch) {
                    Text(LocalizedStringKey.search).textButtonThemed(isEnabled: isEnabled)
                }.buttonThemed(isEnabled: isEnabled)
                    .accessibilityIdentifier(.tagSearchButton)
            }
            HStack{
                Text(helpText)
                    .helpTextThemed()
                Spacer()
            }
        }
    }
}




struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

#Preview {
}
