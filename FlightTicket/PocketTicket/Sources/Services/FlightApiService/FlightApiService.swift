//
//  FlightApiService.swift
//  PocketTicket
//
//  Created by Дмитрий on 03.11.2022.
//

import Foundation
import Combine

final class FlightApiService: FlightApiServiceProtocol {
    var networkService: NetworkServiceProtocol
    
    func ticketNumberPublisher(flightNumber: String) -> AnyPublisher<TicketModel, Error> {
        return networkService.commonRequestPublisher(from: TicketRequestModel(flightNumber: flightNumber))
            .decode(type: TicketModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}
