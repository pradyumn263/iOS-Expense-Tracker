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
        VStack {
            switch (selectedTab) {
                case .home:
                    HomeView()
                case .addTransaction:
                    AddTransactionView()
                case .stats:
                    StatsView()
            }
            VStack(spacing: 0) {
                
                ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom)) {
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
        .ignoresSafeArea(.keyboard, edges: .all)

    }
    
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
            .preferredColorScheme(.dark)
            .environmentObject(CalendarViewModel())
    }
}
