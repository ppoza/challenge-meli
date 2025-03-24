//
//  Middleware.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import Combine


typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>?
