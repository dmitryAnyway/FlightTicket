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
#if RELEASE
        self.wrappedValue = DIContainer.shared.resolve(I.self)
#else
        // Fake
        guard let value = DIContainer.shared.resolveWith(name: "\(I.self)", I.self)  else {
            self.wrappedValue = DIContainer.shared.resolve(I.self)
            return
        }
        self.wrappedValue = value
#endif
    }
}
