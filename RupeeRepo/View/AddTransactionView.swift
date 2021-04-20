//
//  AddTransactionView.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 18/04/21.
//

import SwiftUI

struct CustomTopRR: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft], cornerRadii: CGSize(width: 50, height: 50))
        return Path(path.cgPath)
    }
}

struct FormField: View {
    var fieldName: String
    var iconName: String
    var colorName: String = "yellow-medium"
    var bgColorName: String = "yellow-dark"
    @Binding var fieldValue: String
    

    var body: some View {

        HStack {
            
            Image(systemName: "\(iconName)")
                .font(.title3)
                .foregroundColor(Color(colorName))
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color(bgColorName))
                )
            
            VStack {
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
                RoundedRectangle(cornerRadius: 2)
                    .frame(height: 2)
                    .foregroundColor(Color.black)
                    .opacity(0.05)
                    .padding(.horizontal)

            }
        }
    }
}

struct AddTransactionView: View {
    @State var testString: String = ""
    @State var testAmount: String = ""
    
    var body: some View {
        ZStack {
            Color("yellow-medium")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Add Transaction")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("text-primary"))
                        .padding(.top, 30)
                    
                    
                    Spacer()
                }
                .padding()
                HStack {
                    Text("Enter Details to add a Transaction")
                        .font(.headline)
                        .foregroundColor(Color("text-secondary"))
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, -20)
                
                VStack {
                    FormField(fieldName: "Name", iconName: "cart.fill", fieldValue: $testString)
                        .padding()
                    FormField(fieldName: "Amount", iconName: "indianrupeesign.circle", fieldValue: $testAmount)
                        .padding()
                }
                .padding(.horizontal, 5)
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(Color("bg-secondary"))
                        
                        HStack {
                            Text("📉")
                            Text("Expense")
                                .font(.headline)
                                .foregroundColor(Color("text-secondary"))
                        }
                    }
                    .frame(width: 116, height: 72)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)                            .foregroundColor(Color("green-medium"))
                        
                        HStack {
                            Text("📈")
                            
                            Text("Income")
                                .foregroundColor(Color("text-primary"))
                                .font(.headline)                        }
                    }
                    .frame(width: 116, height: 72)
                    Spacer(minLength: 0)
                }
                .padding()
                
                Spacer()
                    .navigationBarHidden(true)
            }
            .background(
                Color("bg-primary")
            )
            .clipShape(CustomTopRR())
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView()
            .preferredColorScheme(.dark)
    }
}
