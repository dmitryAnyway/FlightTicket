//
//  LoadingView.swift
//  PocketTicket
//
//  Created by Дмитрий on 03.11.2022.
//

import SwiftUI

struct LoadingView: View {
    @State var degrees: Double = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(Color.black)
                .opacity(0.05)
                .zIndex(0)
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(.white)
                .clipped()
                .frame(width: 130, height: 130)
                .zIndex(1)
            Image("Plane", bundle: .main)
                .rotationEffect(.degrees(degrees))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: degrees)
                .onAppear {
                    degrees = 360
                }
                .zIndex(2)
        }
    }
}
