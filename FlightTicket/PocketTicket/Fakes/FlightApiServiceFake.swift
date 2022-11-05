//
//  FlightApiServiceFake.swift
//  PocketTicket
//
//  Created by Дмитрий on 04.11.2022.
//

import Foundation
import Combine

final class FlightApiServiceFake: FlightApiServiceProtocol {
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
