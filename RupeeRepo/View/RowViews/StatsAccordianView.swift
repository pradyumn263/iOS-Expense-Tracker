//
//  StatsAccordianView.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 21/04/21.
//

import SwiftUI

struct StatsAccordianView: View {
    
    @State private var collapsed: Bool = true
    
    var body: some View {
        
        
        VStack {
            
            Button(action: {collapsed.toggle()}, label: {
                TransactionRowView()
            })
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                TransactionRowView()
                TransactionRowView()
                TransactionRowView()
                TransactionRowView()
                TransactionRowView()
                
            }
            .background(Color.blue)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? CGFloat(0) : .none)
            .clipped()
            .animation(.easeOut)
        }
    }
}

struct StatsAccordianView_Previews: PreviewProvider {
    static var previews: some View {
        StatsAccordianView()
    }
}
