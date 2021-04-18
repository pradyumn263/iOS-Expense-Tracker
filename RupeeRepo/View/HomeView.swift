//
//  HomeView.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 18/04/21.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack {
            Spacer(minLength: 100)
           OverviewCardView(imageName: "arrow.down", colorName: "red-medium", title: "Today's Expense", amount: 1552, percentAmount: 23, captionLine: "% of monthly expense")
            
            OverviewCardView(imageName: "arrow.up", colorName: "green-medium", title: "Today's Income", amount: 1600, percentAmount: 41, captionLine: "% of monthly income")
            
            OverviewCardView(imageName: "arrow.up", colorName: "green-medium", title: "Today's Income", amount: 13243, percentAmount: 90, captionLine: "% of monthly income")
            Spacer(minLength: 0)
        }
    }
}

struct OverviewCardView: View {
    var formatter2 = NumberFormatter.getCurrencyFormatter(currency: "₹")
    var formatter = NumberFormatter.getPercentageFormatter()
    @State var imageName: String
    @State var colorName: String
    @State var title: String
    @State var amount: Double
    @State var percentAmount: Double
    @State var captionLine: String

    var calculatedOffset: CGFloat {
        CGFloat(125 - (((percentAmount/100)*250)/2))
    }
    
    var calculatedWidth: Double {
        (percentAmount/100)*250
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("bg-secondary"))
                .frame(width: 360, height: 105)

            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color(colorName))
                    Image(systemName: imageName)
                        .font(.system(size: 21, weight: .bold))
                        .foregroundColor(.white)
                        
                }
                .padding(.leading, 30)
                
                VStack (alignment: .leading) {
                    HStack {
                        Text("\(title)")
                            .bold()
                            .font(.system(size: 14))
                        Spacer(minLength: 0)
                        Text("\(formatter.string(from: NSNumber(value: percentAmount/100))!)")
                            .foregroundColor(Color("\(colorName)"))
                            .bold()
                
                    }
                    .padding(.trailing, 30)
                    HStack {
                        Text("\(formatter2.string(from: NSNumber(value: amount))!)")
                            .bold()
                            .foregroundColor(Color("\(colorName)"))
                        Spacer(minLength: 0)
                        Text(captionLine)
                            .font(.caption2)
                            .foregroundColor(Color("text-secondary"))
                    }
                    .padding(.trailing, 30)

                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 250, height: 10)
                            .foregroundColor(Color("bg-tertiary"))
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color("\(colorName)"))
                            .offset(x: -calculatedOffset)
                            .frame(width: CGFloat(calculatedWidth), height: 10)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
            
    }
}
