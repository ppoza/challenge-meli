//
//  Store.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import Foundation
import Combine
import SwiftUI

typealias AppStore = Store<AppState, AppAction>


final class Store<State, Action>: ObservableObject {

    
    @Published private(set) var state: State
    
    private let reducer: Reducer<State, Action>
    let middlewares: [Middleware<State, Action>]
    private var middlewareCancellables: Set<AnyCancellable> = []

    init(initialState: State,
         reducer: @escaping Reducer<State, Action>,
         middlewares: [Middleware<State, Action>] = []) {
        self.state = initialState
        self.reducer = reducer
        self.middlewares = middlewares
    }

    func dispatch(_ action: Action) {
        reducer(&state, action)
        for mw in middlewares {
            guard let middleware = mw(state, action) else {
                break
            }
            middleware.subscribe(on: DispatchQueue.global(qos: .background))
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: dispatch)
                .store(in: &middlewareCancellables)
        }
    }
}


extension Store {
    func binding<Value>(
        for keyPath: KeyPath<State, Value>,
        action: @escaping (Value) -> Action
    ) -> Binding<Value> {
        Binding<Value>(
            get: { self.state[keyPath: keyPath] },
            set: { newValue in self.dispatch(action(newValue)) }
        )
    }
}

let appStore = AppStore(
    initialState: AppState(),
    reducer: appReducer,
    middlewares: [logMiddleware, productsMiddleware, productDetailMiddleware])
