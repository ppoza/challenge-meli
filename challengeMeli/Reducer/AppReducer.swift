//
//  AppAction.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

let appReducer: Reducer<AppState, AppAction> = { state, action in
    switch action {
        case .navigation(let navigationAction):
            navigationReduce(&state, navigationAction)
        case .clearError:
            state.alertErrorMessage = nil
        case .showError(let message):
            state.alertErrorMessage = message
        default:
            homeReducer(&state, action)
    }
}



