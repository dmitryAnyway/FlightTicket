//
//  FlightService.swift
//  PocketTicket
//
//  Created by Дмитрий on 01.11.2022.
//

import Foundation
import Combine
import Alamofire

final class NetworkService: NetworkServiceProtocol {
    func commonRequestPublisher(from request: RequestModelProtocol) -> AnyPublisher<Data, Error> {
        var components = URLComponents()
        
        components.scheme = request.urlComponents.scheme
        components.host = request.urlComponents.host
        components.path = request.paths.map { "/\($0)" }.joined()
        components.queryItems = request.parameter?.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let url = components.url else {
            return Empty().eraseToAnyPublisher()
        }
        print(url)
        var urlRequest = URLRequest(url: url, timeoutInterval: 10)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .retry(1)
            .mapError { $0 as Error }
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
