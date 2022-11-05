//
//  TicketModel.swift
//  PocketTicket
//
//  Created by Дмитрий on 03.11.2022.
//

import Foundation
import Alamofire

struct TicketRequestModel: RequestModelProtocol {
    private var flightNumber: String
    
    var urlComponents: UrlComponents = .flightAPI
    
    var method: HTTPMethod = .get
    
    var paths: [String] = ["api","v9","flights"]
    
    var parameter: [String : String]?
    
    var body: Data? = nil
    
    var jsonResource: String = "flightNumber"
    
    init(flightNumber: String) {
        self.flightNumber = flightNumber
        
        parameter = [
            "api_key": "b4917f02-f3fa-487e-8d92-c8309f0ba180",
            "flight_number": flightNumber
        ]
    }
}
