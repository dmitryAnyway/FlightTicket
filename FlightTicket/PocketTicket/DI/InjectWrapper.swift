//
//  InjectWrapper.swift
//  PocketTicket
//
//  Created by Дмитрий on 30.10.2022.
//

import Foundation

@propertyWrapper
struct Inject<I> {
    let wrappedValue: I
    init () {
        // Преобразовываем интерфейс в реализацию.
        self.wrappedValue = DIContainer.shared.resolve(I.self)
    }
}
