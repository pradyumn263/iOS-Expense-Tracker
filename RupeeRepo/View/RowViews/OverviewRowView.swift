//
//  OverviewRowView.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 21/04/21.
//

import SwiftUI

struct OverviewRowView: View {
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
                    .frame(maxWidth: .infinity, idealHeight: 90)
                    .frame(height: 90)

                HStack (alignment: .bottom) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color(colorName))
                        Image(systemName: imageName)
                            .font(.system(size: 21, weight: .bold))
                            .foregroundColor(.white)
                            
                    }
                    .padding(.leading)
                    
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
                        HStack {
                            Text("\(formatter2.string(from: NSNumber(value: amount))!)")
                                .bold()
                                .foregroundColor(Color("\(colorName)"))
                            Spacer(minLength: 0)
                            Text(captionLine)
                                .font(.caption2)
                                .foregroundColor(Color("text-secondary"))
                        }

                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 250, height: 10)
                                .foregroundColor(Color("bg-tertiary"))
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(Color("\(colorName)"))
                                .offset(x: -calculatedOffset)
                                .frame(width: CGFloat(calculatedWidth), height: 10)
                        }
                        .frame(maxWidth: .infinity)
                        .aspectRatio(contentMode: .fit)
                    }
                    .padding(.trailing)

                }
            }
        }
    
}

struct OverviewRowViewContainer : View {
     @State private var value = 0

     var body: some View {
        OverviewRowView(imageName: "arrow.up", colorName: "green-medium", title: "Today's Income", amount: 1600, percentAmount: 41, captionLine: "% of monthly income")
        .environmentObject(CalendarViewModel())
     }
}

struct OverviewRowView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewRowViewContainer()
    }
}
