//
//  Container.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import Swinject


extension Container {
    private static var _shared: Container = container
    static var shared: Container {
       get { return _shared }
       set { _shared = newValue }
    }
}

let container: Container = {
    let c = Container()
    c.register(LocalStorage.self) { _ in UserDefaulLocalStorage()}.inObjectScope(.container)
    c.register(ApiServiceProtocol.self) { _ in ApiService()}
    
    c.register(ProductsRemoteDataSourceProtocol.self) { _ in ProductsRemoteDataSource()}.inObjectScope(.container)
    
    c.register(ProductsRepositoryProtocol.self) { _ in ProductsRepository()}.inObjectScope(.container)
    
    return c
}()

@propertyWrapper
struct Inject<T> {
    let wrappedValue: T

    init() {
        self.wrappedValue = Container.shared.resolve(T.self)!
    }
}
