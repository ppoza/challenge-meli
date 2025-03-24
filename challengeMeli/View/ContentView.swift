//
//  ContentView.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: AppStore
    var body: some View {
        VStack {
            MainScreenView()
        }.alert(
            LocalizedStringKey.error,
            isPresented: .constant(store.state.alertErrorMessage != nil),
            actions: {
                Button(LocalizedStringKey.ok) {
                    store.dispatch(.clearError) // Clear the error
                }
            },
            message: {
                if let errorMessage = store.state.alertErrorMessage {
                    Text(errorMessage)
                }
            }
        )
    }
}

#Preview {
    let store = Store(initialState: AppState(), reducer: appReducer)
    ContentView().environmentObject(store)
}
