//
//  FlightApiServiceProtocol.swift
//  PocketTicket
//
//  Created by Дмитрий on 03.11.2022.
//

import Foundation
import Combine

protocol FlightApiServiceProtocol {
    func ticketNumberPublisher(flightNumber: String) -> AnyPublisher<TicketModel, Error>
    var networkService: NetworkServiceProtocol { get set }
}
