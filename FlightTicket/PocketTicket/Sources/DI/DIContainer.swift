//
//  DIContainer.swift
//  PocketTicket
//
//  Created by Дмитрий on 29.10.2022.
//
import Swinject

enum Fakes: String {
    case networkService = "NetworkServiceProtocol"
    case flightService = "FlightApiServiceProtocol"
}

class DIContainer {
    
    static let shared = DIContainer()
    
    let container = Container() { container in
        // Assemblies
        container.register(FlightNumberAssemblyProtocol.self) { _ in
            FlightNumberAssembly()
        }
        // Services
        container.register(NetworkServiceProtocol.self) { _ in
            NetworkService()
        }
        container.register(FlightApiServiceProtocol.self) { _ in
            FlightApiService(networkService: DIContainer.shared.resolve(NetworkServiceProtocol.self))
        }
        // Fakes
        container.register(NetworkServiceProtocol.self, name: Fakes.networkService.rawValue) { _ in
            NetworkServiceFake()
        }
        container.register(FlightApiServiceProtocol.self, name: Fakes.flightService.rawValue) { _ in
            FlightApiServiceFake(networkService: DIContainer.shared.resolveWith(name: Fakes.networkService.rawValue, NetworkServiceProtocol.self)!)
        }
    }
    
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
                                 
    func resolveWith<T>(name: String, _ type: T.Type) -> T? {
        container.resolve(T.self, name: name)
    }

    
    private init() {}
}
