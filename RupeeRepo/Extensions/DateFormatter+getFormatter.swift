//
//  DateFormatter+getFormatter.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 18/04/21.
//

import Foundation

extension DateFormatter {
    static var getDayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        return formatter
    }
    
    static var getDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter
    }
    
    static var getMonthFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter
    }
    
    static var getMonthAndDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"
        return formatter
    }
    
    static var getCompleteMonthFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter
    }
    
    static var getMonthAndYearFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM, yy"
        return formatter
    }
    
    static var getddmmyyFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter
    }
    
    static var getDateandTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy hh:mm a"
        return formatter
    }
    
    
    
}
