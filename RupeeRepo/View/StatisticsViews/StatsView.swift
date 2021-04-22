//
//  StatsView.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 18/04/21.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Statistics")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .padding()
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    Text("Monthly")
                        .font(.headline)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color("bg-secondary"))
                        )
                    Text("Yearly")
                        .font(.headline)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color("bg-secondary"))
                        )
                }
                .padding(.horizontal)
            }
            
            ScrollView {
                VStack {
                    HStack {
                        Text("25 April, 2021")
                            .font(.headline)
                        Spacer()
                        VStack {
                            HStack {
                                Image(systemName: "chevron.up")
                                    .font(.headline)
                                    .foregroundColor(Color("green-medium"))
                                Text("₹ 1299")
                                    .font(.headline)
                            }
                            
                            HStack {
                                Image(systemName: "chevron.down")
                                    .font(.headline)
                                    .foregroundColor(Color("red-medium"))
                                Text("₹ 1299")
                                    .font(.headline)
                            }
                        }
                    }
                    .padding()
                    
                    
                    HStack {
                        Text("25 April, 2021")
                            .font(.headline)
                        Spacer()
                        VStack {
                            HStack {
                                Image(systemName: "chevron.up")
                                    .font(.headline)
                                    .foregroundColor(Color("green-medium"))
                                Text("₹ 1299")
                                    .font(.headline)
                            }
                            
                            HStack {
                                Image(systemName: "chevron.down")
                                    .font(.headline)
                                    .foregroundColor(Color("red-medium"))
                                Text("₹ 1299")
                                    .font(.headline)
                            }
                        }
                    }
                    .padding()
                    
                    VStack {
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
                    .padding(.horizontal)

                    
                }
                Spacer(minLength: 100)
            }
            
            Spacer()
            
            
            
        }
        .navigationBarHidden(true)

    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
            .preferredColorScheme(.dark)
    }
}
