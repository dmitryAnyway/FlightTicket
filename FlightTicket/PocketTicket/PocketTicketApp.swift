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
    @AppStorage("shouldShowOnBoarding") var shouldShowOnBoarding: Bool = true
//    @State var toggle = true
    
    var body: some Scene {
        WindowGroup {
            
            if shouldShowOnBoarding {
                FlightNumberModule2View()
            } else {
            FlightNumberView(viewModel: flightNumberAssembly.assemble())
            }
        }
    }
}
