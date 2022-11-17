//
//  PocketTicketApp.swift
//  PocketTicket
//
//  Created by Дмитрий on 29.10.2022.
//

import SwiftUI

@main
struct PocketTicketApp: App {
    @Inject private var flightNumberAssembly: FlightNumberAssemblyProtocol
    
    var body: some Scene {
        WindowGroup {
            FlightNumberView(viewModel: flightNumberAssembly.assemble())
        }
    }
}
