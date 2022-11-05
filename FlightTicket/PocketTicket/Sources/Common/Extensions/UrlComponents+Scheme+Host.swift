//
//  UrlComponents.swift
//  PocketTicket
//
//  Created by Дмитрий on 03.11.2022.
//

import Foundation

extension UrlComponents {
    var scheme: String {
        switch self {
        case .flightAPI:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .flightAPI:
            return "airlabs.co"
        }
    }
}
