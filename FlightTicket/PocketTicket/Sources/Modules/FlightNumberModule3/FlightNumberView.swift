//
//  FlightNumberView.swift
//  PocketTicket
//
//  Created by Дмитрий on 29.10.2022.
//

import SwiftUI

struct FlightNumberView: View {
    @StateObject var viewModel: FlightNumberViewModel
    @State private var paddingFromTop: CGFloat = 100
    
    var body: some View {
        switch viewModel.isLoading {
        case false:
            FlightView(viewModel: viewModel, paddingFromTop: $paddingFromTop)
        case true:
            LoadingView()
        }
    }
}

struct FlightView: View {
    @StateObject var viewModel: FlightNumberViewModel
    @Binding var paddingFromTop: CGFloat
    @AppStorage("shouldShowOnBoarding") var shouldShowOnBoarding: Bool = false
    
    var body: some View {
        let showError = Binding<Bool>(
            get: { !self.viewModel.error.isEmpty },
            set: { _ in }
        )
        let navigateForward = Binding<Bool>(
            get: {
                return viewModel.error == .emptyLine &&
                viewModel.isLoading == false &&
                viewModel.navigateForward == true
            },
            set: { _ in }
        )
        
        return NavigationView {
            VStack {
                VStack {
                    Text("Номер рейса")
                        .font(.title)
                    TextField("Например: АE 3106", text: $viewModel.flightNumber)
                        .padding(.horizontal)
                        .textFieldStyle(.roundedBorder)
                    Text("По номеру рейса мы можем показать вам подробную информацию")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }.padding(.vertical, paddingFromTop)
                Spacer()
                Button(action: {
                    viewModel.findFlight()
                }) {
                    Text("Найти")
                    // Тут переходим на следующее вью
                    NavigationLink(isActive: navigateForward) {
                        Text("\(viewModel.ticketInfo?.request?.client?.geo?.continent ?? "")\n\(viewModel.ticketInfo?.request?.client?.geo?.country ?? "")")
                    } label: {}
                }.disabled(viewModel.isFindButtonDisabled)
                    .foregroundColor(.black)
                    .buttonStyle(.borderedProminent)
                    .padding()
            }
            .alert(viewModel.error, isPresented: showError) {
                Button("Ok", role: .cancel) {
                    viewModel.error = .emptyLine
                }
            }
            .hiddenNavigationBarStyle()
            .onAppear { // переключает показ 1 раз
                shouldShowOnBoarding = false
            }
        }
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier(HiddenNavigationBar())
    }
}
