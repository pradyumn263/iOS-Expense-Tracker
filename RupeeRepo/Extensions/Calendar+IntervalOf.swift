//
//  Calendar+IntervalOf.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 18/04/21.
//

import Foundation

extension Calendar {
    func intervalOfWeek(for date: Date) -> DateInterval? {
        return dateInterval(of: .weekOfYear, for: date)
    }
    
    func startOfWeek(for date: Date) -> Date? {
        return intervalOfWeek(for: date)?.start
    }
    
    func daysWithSameWeekOfYear(as date: Date) -> [Date] {
        guard let startOfWeek = startOfWeek(for: date) else {
            return []
        }
        
        return (0...6).reduce(into: []) { result, daysToAdd in
            result.append(Calendar.current.date(byAdding: .day, value: daysToAdd, to: startOfWeek))
        }
        .compactMap { $0 }
    }
    
    func intervalOfMonth(for date: Date) -> DateInterval? {
        return dateInterval(of: .month, for: date)
    }
    
    func startOfMonth(for date: Date) -> Date? {
        intervalOfMonth(for: date)?.start
    }
    
    func endOfMonth(for date: Date) -> Date? {
        intervalOfMonth(for: date)?.end
    }
    
    func daysWithSameMonth(as date: Date) -> [Date] {
        var dates: [Date] = []
        let interval = intervalOfMonth(for: date)!
        
        var currentDate = interval.start
        
        while (currentDate < interval.end) {
            dates.append(currentDate)
            currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        return dates
    }
    
    func intervalOfYear(for date: Date) -> DateInterval? {
        return dateInterval(of: .year, for: date)
    }
    
    func startOfYear(for date: Date) -> Date? {
        intervalOfYear(for: date)?.start
    }
    
    func endOfYear(for date: Date) -> Date? {
        intervalOfYear(for: date)?.end
    }
    
    func daysWithSameYear(as date: Date) -> [Date] {
        var dates: [Date] = []
        let interval = intervalOfYear(for: date)!
        
        var currentDate = interval.start
        
        while (currentDate < interval.end) {
            dates.append(currentDate)
            currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        return dates
    }
}
