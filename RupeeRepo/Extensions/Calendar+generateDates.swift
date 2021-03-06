//
//  Calendar+generateDates.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 18/04/21.
//
import Foundation

extension Calendar {
    func generateDates (
        inside interval: DateInterval,
        matching components: DateComponents
    ) -> [Date] {
        var dates: [Date] = []
        dates.append(interval.start)
        
        enumerateDates(startingAfter: interval.start, matching: components, matchingPolicy: .nextTime) { date, _, stop in
            if let date = date {
                if date <= interval.end {
                    dates.append(date)
                } else {
                    stop = true
                }
            }
        }
        
        return dates
    }
}
