//
//  ContentView.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 17/04/21.
//

import SwiftUI

struct CustomBottomRR: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 25, height: 25))
        return Path(path.cgPath)
    }
}

struct ContentView: View {
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color("bg-primary"))
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor(Color("text-primary"))
        ]
        appearance.shadowColor = UIColor(Color("stroke"))
        UINavigationBar.appearance().barTintColor = UIColor(Color("bg-primary"))
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("bg-primary")
                    .edgesIgnoringSafeArea(.all)
                VStack (spacing: 0) {
                    GeometryReader { geometry in
                        HStack {
                            VStack {
                                Text("Mon")
                                    .font(.caption)
                                Text("11")
                            }
                            .foregroundColor(Color("text-primary"))
                            .frame(width: geometry.size.width/8, height:  geometry.size.width/8)
                            
                            
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
                                .frame(width: 1000)
                    )
                    }
                    Divider()
                        .overlay(
                            Color("stroke")
                        )
                    
                    Spacer()
                    
                    ZStack {
                        HStack {
                            Spacer()
                            Text("Hey")
                            Spacer()
                        }
                    }
                    .background(
                        Color("bg-secondary")
                            .clipShape(CustomBottomRR())
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 375, height: 96)
                    )
                }
                .navigationBarTitle("April 2021")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Apr".uppercased())
                            .font(.caption)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(Color("bg-secondary"))
                            )
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("Apr".uppercased())
                            .font(.caption)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(Color("bg-secondary"))
                            )
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
