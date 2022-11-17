//
//  Extension + String.swift
//  PocketTicket
//
//  Created by Андрей Русин on 03.11.2022.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(self,
                          tableName: "Localizable",
                          bundle: .main,
                          value: self,
                          comment: self)
    }
}
