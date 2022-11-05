//
//  NetworkServiceFake.swift
//  PocketTicket
//
//  Created by Дмитрий on 04.11.2022.
//

import Foundation
import Combine

final class NetworkServiceFake: NetworkServiceProtocol {
    @Published var data: Data = Data()
    
    func commonRequestPublisher(from request: RequestModelProtocol) -> AnyPublisher<Data, Error> {
        
        if let path = Bundle.main.path(forResource: request.jsonResource, ofType: "json") {
            do {
                data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            } catch {
                fatalError()
            }
        }
        
        return Just(data)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
