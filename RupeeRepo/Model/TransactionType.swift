//
//  TransactionType.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 22/04/21.
//

import Foundation

enum TransactionType: Int32 {
    case income = 1
    case expense = 0
}

extension TransactionLog {
    var transactionType: TransactionType {
        get {
            return TransactionType(rawValue: Int32(type)) ?? .expense
        }
        
        set {
            type = Int32(newValue.rawValue)
        }
    }
}
