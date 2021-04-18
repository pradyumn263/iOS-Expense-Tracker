//
//  CustomTabBar.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 18/04/21.
//

import SwiftUI

var tabs = ["home", "add", "stats"]

struct CustomTabBar: View {
    
    @State var selectedTab = "home"
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                HStack {
                    VStack {
                        Text("Mon")
                            .font(.caption)
                        Text("11")
                    }
                    .foregroundColor(Color("text-primary"))
                    .frame(width: geometry.size.width/8, height: geometry.size.width/8)
                    
                    
                    VStack {
                        Text("Tue")
                            .font(.caption)
                        Text("12")
                    }
                    .foregroundColor(Color("text-primary"))
                    .frame(width:  geometry.size.width/8, height:  geometry.size.width/8)
                    
                    VStack {
                        Text("Wed")
                            .font(.caption)
                        Text("13")
                    }
                    .foregroundColor(Color("text-primary"))
                    .frame(width:  geometry.size.width/8, height:  geometry.size.width/8)
                    
                    VStack {
                        Text("Thu")
                            .font(.caption)
                        Text("14")
                    }
                    .foregroundColor(Color("text-primary"))
                    .frame(width:  geometry.size.width/8, height:  geometry.size.width/8)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color("green-medium"))
                    )
                    
                    VStack {
                        Text("Fri")
                            .font(.caption)
                        Text("15")
                    }
                    .foregroundColor(Color("text-primary"))
                    .frame(width:  geometry.size.width/8, height:  geometry.size.width/8)
                    
                    VStack {
                        Text("Sat")
                            .font(.caption)
                        Text("16")
                    }
                    .foregroundColor(Color("text-primary"))
                    .frame(width:  geometry.size.width/8, height:  geometry.size.width/8)
                    
                    VStack {
                        Text("Sun")
                            .font(.caption)
                        Text("17")
                    }
                    .foregroundColor(Color("text-primary"))
                    .frame(width:  geometry.size.width/8, height:  geometry.size.width/8)
                } // :- CALENDAR ROW
                .padding(.top, 5)
                .padding(.bottom, 5)
                .background(
                    Rectangle()
                        .foregroundColor(Color("bg-secondary"))
                        .frame(width: 1000, height: geometry.size.width/6.5)
                        .overlay(
                            Rectangle()
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color("stroke"))
                        )
                    )
                .zIndex(100)
            
                ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag("home")
                    
                    AddTransactionView()
                        .tag("add")
                    
                    StatsView()
                        .tag("stats")
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .ignoresSafeArea(.all, edges: .bottom)
                
                
                HStack (alignment: .firstTextBaseline ,spacing: 20) {
                    Spacer(minLength: 0)
                    Image(systemName: "house.fill")
                        .font(.title)
                        .onTapGesture {
                            selectedTab = "home"
                        }
                        .foregroundColor(selectedTab == "home" ? Color("green-medium") : Color("text-secondary"))
                    Spacer(minLength: 0)

                    Image(systemName: "plus.app.fill")
                        .foregroundColor(selectedTab == "add" ? Color("green-medium") : Color("text-secondary"))
                        .font(.title)
                        .onTapGesture {
                            selectedTab = "add"
                        }
                    Spacer(minLength: 0)

                    Image(systemName: "chart.bar.xaxis")
                        .font(.title)
                        .onTapGesture {
                            selectedTab = "stats"
                        }
                        .foregroundColor(selectedTab == "stats" ? Color("green-medium") : Color("text-secondary"))
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
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
            .preferredColorScheme(.dark)
    }
}
