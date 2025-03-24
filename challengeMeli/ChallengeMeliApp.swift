//
//  challenge_meliApp.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import SwiftUI

@main
struct challenge_meliApp: App {
   
    @State private var searchText: String = ""
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appStore)
        }
    }
}
