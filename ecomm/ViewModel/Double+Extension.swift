//
//  Double+Extension.swift
//  ecomm
//
//  Created by Tejash Singh on 12/04/24.
//

import Foundation

extension Double {
    func toString() -> String {
        return String(format: "%.1f",self)
    }
    func currencyFormat() -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
