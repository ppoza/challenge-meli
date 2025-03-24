//
//  State.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import Foundation

struct AppState {
    
    // App state
    var alertErrorMessage: String? = nil
    
    // States
    var homeRouteStack: [Route] = []
    var searchResultState = SearchResultState()
    var searchState = SearchState()
}


