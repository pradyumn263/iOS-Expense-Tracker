//
//  CustomTabBar.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 18/04/21.
//

import SwiftUI

enum availableTabs: String, CaseIterable {
    case home = "home"
    case addTransaction = "add"
    case stats = "stats"
}

struct CustomTabBar: View {
    
    @State var selectedTab: availableTabs = .home
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    @EnvironmentObject var calendarManager: CalendarViewModel
    
    var dayFormatter = DateFormatter.getDayFormatter
    var dateFormatter = DateFormatter.getDateFormatter
    
    var body: some View {
        VStack(spacing: 0) {
            HStack (spacing: 6) {
                ForEach (0..<calendarManager.getCurrentWeekArray.count) { index in
                    VStack {
                        Text("\(dayFormatter.string(from: calendarManager.getCurrentWeekArray[index]))")
                            .font(.caption)
                        Text("\(dateFormatter.string(from: calendarManager.getCurrentWeekArray[index]))")
                    }
                    .foregroundColor(Color("text-primary"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .aspectRatio(1, contentMode: .fit)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(calendarManager.currentSelectedDate.isTheSameDate(as: calendarManager.currentWeekDatesArray[index]) ?  Color("green-medium") : Color("bg-secondary"))
                    )
                    .onTapGesture {
                        calendarManager.currentSelectedDate = calendarManager.currentWeekDatesArray[index]
                        
                    }
                }
            } // :- CALENDAR ROW
            .padding(.top, 5)
            .padding(.bottom, 5)
            .padding(.horizontal, 5)
            .background(
                Rectangle()
                    .foregroundColor(Color("bg-secondary"))
                    .frame(width: 1000)
                    .overlay(
                        Rectangle()
                            .stroke(lineWidth: 1)
                            .foregroundColor(Color("stroke"))
                    )
            )
            .zIndex(1)
            
            ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                
                switch (selectedTab) {
                case .home:
                    HomeView()
                        .padding(.horizontal, 10)
                case .addTransaction:
                    AddTransactionView()
                case .stats:
                    StatsView()
                }
                
                HStack (alignment: .firstTextBaseline ,spacing: 20) {
                    Spacer(minLength: 0)
                    Image(systemName: "house.fill")
                        .font(.title)
                        .onTapGesture {
                            selectedTab = .home
                        }
                        .foregroundColor(selectedTab == .home ? Color("green-medium") : Color("text-secondary"))
                    Spacer(minLength: 0)
                    
                    Image(systemName: "plus.app.fill")
                        .foregroundColor(selectedTab == .addTransaction ? Color("green-medium") : Color("text-secondary"))
                        .font(.title)
                        .onTapGesture {
                            selectedTab = .addTransaction
                        }
                    Spacer(minLength: 0)
                    
                    Image(systemName: "chart.bar.xaxis")
                        .font(.title)
                        .onTapGesture {
                            selectedTab = .stats
                        }
                        .foregroundColor(selectedTab == .stats ? Color("green-medium") : Color("text-secondary"))
                    Spacer(minLength: 0)
                    
                }
                .padding(.horizontal)
                .padding(.bottom)
                .background(
                    Color("bg-secondary")
                        .clipShape(CustomBottomRR())
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 96)
                        .shadow(color: Color(.black).opacity(0.4), radius: 5)
                )
            }
        }
    }
    
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
            .preferredColorScheme(.dark)
            .environmentObject(CalendarViewModel())
    }
}
