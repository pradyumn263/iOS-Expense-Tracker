//
//  RupeeRepoApp.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 17/04/21.
//

import SwiftUI

@main
struct RupeeRepoApp: App {
    @ObservedObject var calendarManager = CalendarViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(calendarManager)
        }
    }
}
