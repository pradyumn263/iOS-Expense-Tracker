//
//  AddTransactionViewModel.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 22/04/21.
//

import Foundation
import Combine

class AddTransactionViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var amount: String = ""
    @Published var type: TransactionType = TransactionType.expense
    @Published var date: Date = Date()
    @Published var icon: String = ""
    @Published var notes: String = ""
    @Published var location: String = ""
    
    @Published var isNameValid: Bool = false
    @Published var isAmountValid: Bool = false
    @Published var isFormInputValid: Bool = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(paymentActivity: TransactionLog?) {
        
        name = paymentActivity?.name ?? ""
        amount = "\(paymentActivity?.amount ?? 0.0)"
        type = paymentActivity?.transactionType ?? TransactionType.expense
        
        self.date = paymentActivity?.date ?? Date()
        
        $name
            .receive(on: RunLoop.main)
            .map { name in
                return name.count > 0
            }
            .assign(to: \.isNameValid, on: self)
            .store(in: &cancellableSet)
                        
        $amount
            .receive(on: RunLoop.main)
            .map { amount in
                guard let validAmount = Double(amount) else {
                    return false
                }
                return validAmount > 0
            }
            .assign(to: \.isAmountValid, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest($isNameValid, $isAmountValid)
            .receive(on: RunLoop.main)
            .map { (isNameValid, isAmountValid) in
                return isNameValid && isAmountValid
            }
            .assign(to: \.isFormInputValid, on: self)
            .store(in: &cancellableSet)
    }
}
