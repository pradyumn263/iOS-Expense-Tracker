//
//  TransactionRowView.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 21/04/21.
//

import SwiftUI

struct TransactionRowView: View {
    var body: some View {
        ZStack {
            RoundedRectangle (cornerRadius: 12)
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .foregroundColor(Color("bg-secondary"))
            
            HStack {
                RoundedRectangle(cornerRadius: 12)
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 80)
                    .foregroundColor(Color("bg-secondary"))
                    .overlay (
                        Text("🥳")
                            .font(.largeTitle)
                    )
                    .overlay (
                        RoundedRectangle(cornerRadius: 12)
                            .trim(from: 0, to: 0.45)
                            .rotation(Angle(degrees: -90))
                            .stroke(lineWidth: 3)
                            .aspectRatio(1, contentMode: .fit)
                            .frame(height: 78)
                            .foregroundColor(Color("green-medium"))
                    )
                
                Text("Netflix")
                    .font(.headline)
                    .foregroundColor(Color("text-primary"))
                Spacer()
                Text("₹1200")
                    .foregroundColor(Color("text-primary"))
                    .bold()
                    .font(.title3)
                    .padding()
            }
        }

    }
}

struct TransactionRowView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRowView()
    }
}
