//
//  LogMiddleware.swift
//  challengeMeli
//
//  Created by Pablo Poza on 23/03/2025.
//
import Combine

let logMiddleware: Middleware<AppState, AppAction> = { state, action in
    print(action)
    return Empty().eraseToAnyPublisher()
}
