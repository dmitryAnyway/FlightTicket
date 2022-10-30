//
//  FlightNumberAssembly.swift
//  PocketTicket
//
//  Created by Дмитрий on 29.10.2022.
//

import Foundation
import SwiftUI

protocol FlightNumberAssemblyProtocol {
    /// Возвращает собранную viewModel
    func assemble() -> FlightNumberViewModel
}

final class FlightNumberAssembly: FlightNumberAssemblyProtocol {
    func assemble() -> FlightNumberViewModel {
        // тут собираем вью модель
        return FlightNumberViewModel()
    }
}
