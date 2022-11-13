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
    
    @State var toggle = true
    
    var body: some Scene {
        WindowGroup {
            
            OnboardingView(shouldShowOnBoarding: $toggle, areYouGoingToSecondView: false, goToModel3: flightNumberAssembly.assemble())
        }
    }
}
