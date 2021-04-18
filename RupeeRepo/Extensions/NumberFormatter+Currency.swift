//
//  NumberFormatter+Currency.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 18/04/21.
//

import Foundation

extension NumberFormatter {
    static func getCurrencyFormatter(currency: String) ->  NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.currencySymbol = currency
        return formatter
    }
}

