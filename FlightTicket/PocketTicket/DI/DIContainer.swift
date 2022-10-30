//
//  DIContainer.swift
//  PocketTicket
//
//  Created by Дмитрий on 29.10.2022.
//
import Swinject

class DIContainer {
    
    static let shared = DIContainer()
    
    let container = Container() { container in
        // Assemblies
        container.register(FlightNumberAssemblyProtocol.self) { _ in
            FlightNumberAssembly()
        }
        // Network service
        // следующий скорее всего будет Network service
    }
    
    func resolve<T>(_ type: T.Type ) -> T {
        container.resolve(T.self )!
    }
    
    private init() {}
}
