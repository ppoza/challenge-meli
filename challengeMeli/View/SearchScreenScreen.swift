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
                set: { store.dispatch(.updateSearchText($0)) }
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

#Preview {
}
