//
//  Date+isSameDateAs.swift
//  MoneyManager
//
//  Created by Pradyumn Shukla on 17/03/21.
//

import Foundation

extension Date {
    func isTheSameDate(as otherDate: Date) -> Bool {
        let calendar = Calendar.current
        
        let selfComponents = calendar.dateComponents([.day, .month, .year], from: self)
        let otherComponents = calendar.dateComponents([.day, .month, .year], from: otherDate)
        return selfComponents == otherComponents
        
    }
    
    func isTheSameMonth(as otherDate: Date) -> Bool {
        let calendar = Calendar.current
        
        let selfComponents = calendar.dateComponents([.month, .year], from: self)
        let otherComponents = calendar.dateComponents([.month, .year], from: otherDate)
        return selfComponents == otherComponents
    }
}
