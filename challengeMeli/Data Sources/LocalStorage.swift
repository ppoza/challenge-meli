//
//  LocalStorage.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

protocol LocalStorage {
    func getString(_ key: String) -> String
}

class UserDefaulLocalStorage: LocalStorage {
    func getString(_ key: String) -> String {
        return "From user defaul"
    }
}
