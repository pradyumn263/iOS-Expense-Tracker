//
//  AddTransactionView.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 18/04/21.
//

import SwiftUI


// MARK: - CUSTOM SHAPE FOR BG
struct CustomTopRR: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft], cornerRadii: CGSize(width: 50, height: 50))
        return Path(path.cgPath)
    }
}



// MARK: - TEXT INPUT FIELD VIEW
struct FormField: View {
    var fieldName: String
    var iconName: String
    var colorName: String = "yellow-medium"
    var bgColorName: String = "yellow-dark"
    @Binding var fieldValue: String
    

    var body: some View {

        HStack (spacing: 0) {
            
            Image(systemName: "\(iconName)")
                .font(.title3)
                .foregroundColor(Color(colorName))
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color(bgColorName))
                )
            Spacer(minLength: 3)
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


// MARK: - MAIN VIEW
struct AddTransactionView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var testString: String = ""
    @State var testAmount: String = ""
    @State var value: Date = Date()
    
    private func saveContext()
    {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error \(error)")
        }
    }
    
    var body: some View {
        ZStack {
            Color("yellow-medium")
                .edgesIgnoringSafeArea(.all)
            
            // MARK: - PAGE START
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        
                        // MARK: - HEADLINE
                        Text("Add Transaction")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color("text-primary"))
                            .padding(.top, 30)
                        
                        
                        Spacer()
                    }
                    .padding()
                    
                    // MARK: - SUB HEADLINE
                    HStack {
                        Text("Enter Details to add a Transaction")
                            .font(.headline)
                            .foregroundColor(Color("text-secondary"))
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, -20)
                    
                    
                    // MARK: - FORM INPUT FIELDS
                    VStack {
                        FormField(fieldName: "Name", iconName: "cart.fill", fieldValue: $testString)
                            .padding()
                        
                        // Select from option of pre existing names.
                        
                        ScrollView (.horizontal) {
                            
                            HStack {
                                Text("🛒 Groceries")
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .foregroundColor(Color("bg-secondary"))
                                    )
                                Text("🍽 Food")
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundColor(Color("bg-secondary"))
                                    )
                                
                                Text("⛽️ Petrol")
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundColor(Color("bg-secondary"))
                                    )
                                Text("👕 Clothes")
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundColor(Color("bg-secondary"))
                                    )
                                
                            }
                                
                            
                        }
                        
                        // Select Emoji
                        HStack {
                            Text("Select Icon (if creating new category")
                                .font(.headline)
                                .foregroundColor(Color("text-secondary"))
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        ScrollView (.horizontal) {
                            HStack {
                                Text("🛒")
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundColor(Color("bg-secondary"))
                                    )
                                
                                Text("🍽")
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundColor(Color("bg-secondary"))
                                    )
                                
                                Text("👕")
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundColor(Color("bg-secondary"))
                                    )
                                
                                Text("⛽️")
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundColor(Color("bg-secondary"))
                                    )
                                
                                Text("👓")
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundColor(Color("bg-secondary"))
                                    )
                                
                                Text("🏥")
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundColor(Color("bg-secondary"))
                                    )
                                
                                Text("📱")
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundColor(Color("bg-secondary"))
                                    )
                            }
                        }

                        
                        HStack {
                            FormField(fieldName: "Amount", iconName: "indianrupeesign.circle", fieldValue: $testAmount)
                                .padding()
    //                        FormField(fieldName: "Date", iconName: "calendar", fieldValue: $testAmount)
                            HStack {
                                Image(systemName: "calendar")
                                    .font(.title3)
                                    .foregroundColor(Color("yellow-medium"))
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(Color("yellow-dark"))
                                    )
                                Spacer(minLength: 3)
                                DatePicker("", selection: $value, displayedComponents: .date)
                                    .padding()
                                    .accentColor(Color("yellow-medium"))
                                    .preferredColorScheme(.dark)
                            }
                        }
                    }
                    .padding(.horizontal, 5)
                    
                    // MARK: - TRANSACTION TYPE SELECTORS
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
                            .padding()
                        }
                        
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)                            .foregroundColor(Color("green-medium"))
                            
                            HStack {
                                Text("📈")
                                
                                Text("Income")
                                    .foregroundColor(Color("text-primary"))
                                    .font(.headline)
                                
                            }
                            .padding()
                        }
                        Spacer(minLength: 0)
                    }
                    .padding()
                    
                    // MARK: - NOTES AND LOCATION
                    VStack {
                        FormField(fieldName: "Notes (optional)", iconName: "note.text", fieldValue: $testString)
                            .padding()
                        FormField(fieldName: "Location (optional)", iconName: "location.fill.viewfinder", fieldValue: $testAmount)
                            .padding()
                    }
                    .padding(.horizontal, 5)
                    
                   // MARK: - SUBMIT
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(height: 60)
                            .padding()
                            .foregroundColor(Color("yellow-medium"))
                            .overlay(
                                Text("Add Transaction")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(Color("text-primary"))
                            )
                    })
                    
                    Spacer(minLength: 200)
                        .navigationBarHidden(true)
                } // MARK: - VIEW ENDS HERE
                .background(
                    Color("bg-primary")
                        .clipShape(CustomTopRR())
                )
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}


// MARK: - PREVIEWS
struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView()
            .preferredColorScheme(.dark)
    }
}
