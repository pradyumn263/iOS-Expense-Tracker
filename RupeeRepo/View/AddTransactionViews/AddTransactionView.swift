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

// MARK: - PREPOPULATED CATEGORIES
struct category {
    init(_ emoji: String, _ name: String) {
        self.emoji = emoji
        self.name = name
    }
    var emoji: String
    var name: String
}

var listOfCategories: [category] = [category("🛒","Groceries"), category("🍽","Food"), category("⛽️","Petrol"), category("👕", "Clothes")]



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
    @ObservedObject var TransactionViewModel: AddTransactionViewModel
    
    var currentTransaction: TransactionLog?
    
    init (transaction: TransactionLog? = nil) {
        self.currentTransaction = transaction
        self.TransactionViewModel = AddTransactionViewModel(paymentActivity: currentTransaction)
    }
    
    @State var testString: String = ""
    @State var testAmount: String = ""
    @State var value: Date = Date()
    
    private func saveThisTransaction () {
       let newTransaction = currentTransaction ?? TransactionLog(context: viewContext)
        
        newTransaction.id = UUID()
        newTransaction.name = TransactionViewModel.name
        newTransaction.amount = Double(TransactionViewModel.amount)!
        newTransaction.date = TransactionViewModel.date
        newTransaction.icon = TransactionViewModel.icon
        newTransaction.location = TransactionViewModel.location
        newTransaction.notes = TransactionViewModel.notes
        newTransaction.type = TransactionViewModel.type.rawValue
        
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
                        FormField(fieldName: "Name", iconName: "cart.fill", fieldValue: $TransactionViewModel.name)
                            .padding()
                        
                        // Select from option of pre existing names.
                        
                        ScrollView (.horizontal) {
                            
                            HStack {
                                ForEach(0..<listOfCategories.count) {index in
                                    Text("\(listOfCategories[index].emoji) \(listOfCategories[index].name)")
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .foregroundColor(Color("bg-secondary"))
                                        )
                                        .onTapGesture {
                                            TransactionViewModel.name = listOfCategories[index].name
                                            TransactionViewModel.icon = listOfCategories[index].emoji
                                        }
                                }
                            }
                        }
                        
                        // Select Emoji
                        HStack {
                            Text("Select Icon (if creating new category)")
                                .font(.headline)
                                .foregroundColor(Color("text-secondary"))
                            Spacer()
                        }
                        .padding(.horizontal)
                        
//                        ScrollView (.horizontal) {
//                            HStack {
//                                Text("🛒")
//                                    .padding()
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 12)
//                                            .foregroundColor(Color("bg-secondary"))
//                                    )
//
//                                Text("🍽")
//                                    .padding()
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 12)
//                                            .foregroundColor(Color("bg-secondary"))
//                                    )
//
//                                Text("👕")
//                                    .padding()
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 12)
//                                            .foregroundColor(Color("bg-secondary"))
//                                    )
//
//                                Text("⛽️")
//                                    .padding()
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 12)
//                                            .foregroundColor(Color("bg-secondary"))
//                                    )
//
//                                Text("👓")
//                                    .padding()
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 12)
//                                            .foregroundColor(Color("bg-secondary"))
//                                    )
//
//                                Text("🏥")
//                                    .padding()
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 12)
//                                            .foregroundColor(Color("bg-secondary"))
//                                    )
//
//                                Text("📱")
//                                    .padding()
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 12)
//                                            .foregroundColor(Color("bg-secondary"))
//                                    )
//                            }
//                        }

                        
                        HStack {
                            FormField(fieldName: "Amount", iconName: "indianrupeesign.circle", fieldValue: $TransactionViewModel.amount)
                                .padding()
                            
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
                                DatePicker("", selection: $TransactionViewModel.date, displayedComponents: .date)
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
                                .foregroundColor(TransactionViewModel.type == .expense ?  Color("red-medium") : Color("bg-secondary"))
                            
                            HStack {
                                Text("📉")
                                Text("Expense")
                                    .font(.headline)
                                    .foregroundColor(TransactionViewModel.type == .expense ? Color("text-primary") : Color("text-secondary"))
                            }
                            .padding()
                        }
                        .onTapGesture {
                            TransactionViewModel.type = .expense
                        }
                        
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(TransactionViewModel.type == .income ? Color("green-medium") : Color(
                                "bg-secondary"))
                            
                            HStack {
                                Text("📈")
                                
                                Text("Income")
                                    .foregroundColor(TransactionViewModel.type == .income ? Color("text-primary") : Color("text-secondary"))
                                    .font(.headline)
                                
                            }
                            .padding()
                        }
                        .onTapGesture {
                            TransactionViewModel.type = .income
                        }
                        Spacer(minLength: 0)
                    }
                    .padding()
                    
                    // MARK: - NOTES AND LOCATION
                    VStack {
                        FormField(fieldName: "Notes (optional)", iconName: "note.text", fieldValue: $TransactionViewModel.notes)
                            .padding()
                        FormField(fieldName: "Location (optional)", iconName: "location.fill.viewfinder", fieldValue: $TransactionViewModel.location)
                            .padding()
                    }
                    .padding(.horizontal, 5)
                    
                   // MARK: - SUBMIT
                    
                    Button(action: {
                        saveThisTransaction()
                    }, label: {
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
