//
//  RequestProtocol.swift
//  PocketTicket
//
//  Created by Дмитрий on 03.11.2022.
//

import Foundation
import Alamofire

protocol RequestModelProtocol {
    var urlComponents: UrlComponents { get }
    var method: HTTPMethod { get }
    var paths: [String] { get }
    var parameter: [String: String]? { get }
    var body: Data? { get }
    var jsonResource: String { get }
}
