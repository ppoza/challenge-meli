//
//  TestDepencies.swift
//  challengeMeli
//
//  Created by Pablo Poza on 24/03/2025.
//

import Swinject
@testable import challengeMeli

let testContainer: Container = {
    let c = Container()
    c.register(LocalStorage.self) { _ in UserDefaulLocalStorage()}.inObjectScope(.container)
    c.register(ApiServiceProtocol.self) { _ in ApiService()}
    
    c.register(ProductsRemoteDataSourceProtocol.self) { _ in ProductsRemoteDataSource()}.inObjectScope(.container)
    
    c.register(ProductsRepositoryProtocol.self) { _ in ProductsRepository()}.inObjectScope(.container)
    
    return c
}()

let testMockContainer: Container = {
    let c = Container()
    c.register(LocalStorage.self) { _ in UserDefaulLocalStorage()}.inObjectScope(.container)
    c.register(ApiServiceProtocol.self) { _ in MockAPIService()}
    
    c.register(ProductsRemoteDataSourceProtocol.self) { _ in ProductsRemoteDataSource()}.inObjectScope(.container)
    
    c.register(ProductsRepositoryProtocol.self) { _ in ProductsRepository()}.inObjectScope(.container)
    
    return c
}()
