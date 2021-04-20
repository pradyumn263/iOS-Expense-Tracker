//
//  HomeView.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 18/04/21.
//

import SwiftUI
import Foundation

enum currentIndex: Int {
    case zero = 0
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
}

enum SwipeHVDirection: String {
    case left, right, up, down, none
}

func detectDirection(value: DragGesture.Value) -> SwipeHVDirection {
if value.startLocation.x < value.location.x - 24 {
            return .left
          }
          if value.startLocation.x > value.location.x + 24 {
            return .right
          }
          if value.startLocation.y < value.location.y - 24 {
            return .down
          }
          if value.startLocation.y > value.location.y + 24 {
            return .up
          }
  return .none
  }

struct HomeView: View {
    @EnvironmentObject var calendarManager: CalendarViewModel
    var generator = UINotificationFeedbackGenerator()
    var body: some View {
        VStack {
            testView(currDate: calendarManager.currentSelectedDate)
        }
        .animation(.interactiveSpring())
        .gesture(
            DragGesture()
                .onEnded { value in
                    let direction = detectDirection(value: value)
                    if direction == .left {
                        calendarManager.selectPreviousDate()
                    }
                    if direction == .right {
                        calendarManager.selectNextDate()
                    }
                    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                    impactHeavy.impactOccurred()
                }
        )
    }
}

struct testView: View {
    var currDate: Date
    var body: some View {
        ScrollView (showsIndicators: false) {
//            Spacer(minLength: 400)
            HStack {
                Text("Overview")
                    .font(.title)
                    .foregroundColor(Color("text-primary"))
                    .bold()
                    .padding(.top)
                Spacer()
            }
            
            OverviewCardView(imageName: "arrow.up", colorName: "green-medium", title: "Today's Income", amount: 1600, percentAmount: 41, captionLine: "% of monthly income")
            
            OverviewCardView(imageName: "arrow.up", colorName: "green-medium", title: "Today's Income", amount: 13243, percentAmount: 90, captionLine: "% of monthly income")
            OverviewCardView(imageName: "arrow.down", colorName: "red-medium", title: "Today's Expense", amount: 1552, percentAmount: 23, captionLine: "% of monthly expense")
            OverviewCardView(imageName: "arrow.down", colorName: "red-medium", title: "Today's Expense", amount: 1552, percentAmount: 23, captionLine: "% of monthly expense")
            OverviewCardView(imageName: "arrow.down", colorName: "red-medium", title: "Today's Expense", amount: 1552, percentAmount: 23, captionLine: "% of monthly expense")
            OverviewCardView(imageName: "arrow.down", colorName: "red-medium", title: "Today's Expense", amount: 1552, percentAmount: 23, captionLine: "% of monthly expense")
            OverviewCardView(imageName: "arrow.down", colorName: "red-medium", title: "Today's Expense", amount: 1552, percentAmount: 23, captionLine: "% of monthly expense")
//            Spacer(minLength: 500)
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
                .frame(maxWidth: .infinity, idealHeight: 90)

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

struct HomeViewPreviewContainer_2 : View {
     @State private var value = 0

     var body: some View {
          HomeView()
            .environmentObject(CalendarViewModel())
     }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewPreviewContainer_2()
            .preferredColorScheme(.dark)
            .environmentObject(CalendarViewModel())
    }
}
