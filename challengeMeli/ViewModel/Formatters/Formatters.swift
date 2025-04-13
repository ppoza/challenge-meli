//
//  Formatter.swift
//  challengeMeli
//
//  Created by Pablo Poza on 13/04/2025.
//

import Foundation

enum Currency: String {
    case ars
}

extension Double {
    func formattedPrice(currencyCode: Currency = .ars) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode.rawValue.uppercased()
        formatter.currencyGroupingSeparator = "."
        formatter.currencyDecimalSeparator = ""
        formatter.maximumFractionDigits = 0
        
        return formatter.string(from: NSNumber(value: self)) ?? "\(Int(self))"
    }
}
