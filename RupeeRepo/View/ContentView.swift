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
                
               CustomTabBar()
                .navigationBarTitle("Today, 14 April")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Apr".uppercased())
                            .font(.caption2)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(Color("bg-secondary"))
                            )
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("Apr".uppercased())
                            .font(.caption2)
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
