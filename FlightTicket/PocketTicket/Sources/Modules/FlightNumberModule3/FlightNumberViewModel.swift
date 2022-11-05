//
//  FlightNumberViewModel.swift
//  PocketTicket
//
//  Created by Дмитрий on 29.10.2022.
//

import Combine
import Foundation

protocol FlightNumberViewModelProtocol {
    // Ищем введенный номер рейса
    func findFlight()
}

final class FlightNumberViewModel: ObservableObject {
    // проперти
    private var flightService: FlightApiServiceProtocol
    
    var navigateForward: Bool = false
    
    // Published проперти
    @Published var isFindButtonDisabled: Bool = true
#if RELEASE
    @Published var flightNumber: String = .emptyLine
#else
    @Published var flightNumber: String = "3233"
#endif
    @Published var isLoading: Bool = false
    @Published var error: String = .emptyLine
    @Published var ticketInfo: TicketModel?
    
    // ретейним наши Publishers
    private var cancellableSet: Set<AnyCancellable> = []
    
    // Publishers
    // проверяем что пользователь ввел в поле хотя бы 1 символ
    private var isFindButtonDisabledPublisher: AnyPublisher<Bool, Never> {
        $flightNumber
            .map { input in
                return !(input.count > 0)
            }
            .eraseToAnyPublisher()
    }
    
    init(flightService: FlightApiServiceProtocol) {
        // передаем сервис в конструктор
        self.flightService = flightService
        
        // при изменении поля перезагружаем вью модель и пересчитываем isFindButtonDisabled
        isFindButtonDisabledPublisher
            .assign(to: \.isFindButtonDisabled, on: self)
            .store(in: &cancellableSet)
    }
}

extension FlightNumberViewModel: FlightNumberViewModelProtocol {
    func findFlight() {
        isLoading = true
#if DEBUG
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.flightService.ticketNumberPublisher(flightNumber: self.flightNumber)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case let .failure(error):
                    self?.error = error.localizedDescription
                case .finished:
                    break
                }
                
                self?.isLoading = false
            }, receiveValue: { [weak self] response in
                self?.navigateForward = true
                self?.isLoading = false
                self?.ticketInfo = response
            })
            .store(in: &self.cancellableSet)
        }
#else
        flightService.ticketNumberPublisher(flightNumber: flightNumber)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case let .failure(error):
                    self?.error = error.localizedDescription
                case .finished:
                    break
                }
                
                self?.isLoading = false
            }, receiveValue: { [weak self] response in
                self?.navigateForward = true
                // Когда загрузка заканчивается, вызывается navigateForward и осуществляется переход
                // это костыль, подумать как поправить
                self?.isLoading = false
                self?.ticketInfo = response
            })
            .store(in: &cancellableSet)
#endif
    }
}
