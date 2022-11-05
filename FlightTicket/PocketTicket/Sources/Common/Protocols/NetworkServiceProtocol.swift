//
//  NetworkServiceProtocol.swift
//  PocketTicket
//
//  Created by Дмитрий on 05.11.2022.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func commonRequestPublisher(from request: RequestModelProtocol) -> AnyPublisher<Data, Error>
}
