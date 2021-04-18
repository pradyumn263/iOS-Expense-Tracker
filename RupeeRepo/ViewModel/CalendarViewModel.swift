//
//  CalendarViewModel.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 18/04/21.
//

import Foundation

class CalendarViewModel: ObservableObject {
    var calendar: Calendar
    var currentWeek: Int
    var currentDate: Date
    var currentMonth: Int
    var currentYear: Int
    
    init() {
        currentDate = Date()
        calendar = Calendar.current
        currentWeek = calendar.component(.weekOfYear, from: currentDate)
        currentMonth = calendar.component(.month, from: currentDate)
        currentYear = calendar.component(.year, from: currentDate)
        
        currentWeekDatesArray = calendar.daysWithSameWeekOfYear(as: currentDate)
        currentMonthDatesArray = calendar.daysWithSameMonth(as: currentDate)
        currentYearsDatesArray = calendar.daysWithSameYear(as: currentDate)
        print("\(currentWeekDatesArray)")
        let formatter = DateFormatter.getddmmyyFormatter
        print("\(formatter.string(from: currentWeekDatesArray[0]))")
    }
    
    @Published var currentWeekDatesArray: [Date]
    @Published var currentMonthDatesArray: [Date]
    @Published var currentYearsDatesArray: [Date]
    
    var getCurrentWeekArray: [Date] {
        return currentWeekDatesArray
    }
    
    var getCurrentMonthArray: [Date] {
        return currentMonthDatesArray
    }
    
    var getCurrentYearDateArray: [Date] {
        return currentYearsDatesArray
    }
    
    func moveAllArraysToThis(date: Date) {
        currentWeekDatesArray = calendar.daysWithSameWeekOfYear(as: date)
        currentMonthDatesArray = calendar.daysWithSameMonth(as: date)
        currentYearsDatesArray = calendar.daysWithSameYear(as: date)
        
        print("\(currentWeekDatesArray)")
    }
    
    func gotoNextWeek () {
        let currentLastDate = currentWeekDatesArray.last!
        let newFirstDate = calendar.date(byAdding: .day, value: 1, to: currentLastDate)!
        
        moveAllArraysToThis(date: newFirstDate)
    }
    
    func getBackToCurrentWeek () {
        let currentDate = Date()
        moveAllArraysToThis(date: currentDate)
    }
    
    func gotoPreviousWeek () {
        let currentLastDate = currentWeekDatesArray.first!
        let newFirstDate = calendar.date(byAdding: .day, value: -1, to: currentLastDate)!
        
        moveAllArraysToThis(date: newFirstDate)
    }
}
