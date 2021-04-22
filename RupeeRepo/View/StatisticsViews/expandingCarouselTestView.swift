//
//  expandingCarouselTestView.swift
//  RupeeRepo
//
//  Created by Pradyumn Shukla on 21/04/21.
//

import SwiftUI

struct expandingCarouselTestView: View {
    @State var isExpanded = true
    var body: some View {
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
                        Text("🤪")
                            .font(.largeTitle)
                    )
                    .overlay (
                        RoundedRectangle(cornerRadius: 12)
                            .trim(from: 0, to: 0.75)
                            .rotation(Angle(degrees: -90))
                            .stroke(lineWidth: 3)
                            .aspectRatio(1, contentMode: .fit)
                            .frame(height: 78)
                            .foregroundColor(Color("yellow-medium"))
                    )
                
                VStack (alignment: .leading
                ) {
                    Text("Netflix")
                        .font(.headline)
                        .foregroundColor(Color("text-primary"))
                    Text("21/04/21 6:33PM")
                        .foregroundColor(Color("text-secondary"))
                        .font(.caption2)
                }
                Spacer()
                Text("₹1200")
                    .foregroundColor(Color("text-primary"))
                    .bold()
                    .font(.title3)
                    .padding()
            }
        }
            .onTapGesture {
                isExpanded.toggle()
            }
        
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 12)
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 80)
                        .foregroundColor(Color("bg-secondary"))
                        .overlay (
                            Text("🤪")
                                .font(.largeTitle)
                        )
                        .overlay (
                            RoundedRectangle(cornerRadius: 12)
                                .trim(from: 0, to: 0.75)
                                .rotation(Angle(degrees: -90))
                                .stroke(lineWidth: 3)
                                .aspectRatio(1, contentMode: .fit)
                                .frame(height: 78)
                                .foregroundColor(Color("yellow-medium"))
                        )
                    
                    VStack (alignment: .leading
                    ) {
                        Text("Netflix")
                            .font(.headline)
                            .foregroundColor(Color("text-primary"))
                        Text("21/04/21 6:33PM")
                            .foregroundColor(Color("text-secondary"))
                            .font(.caption2)
                    }
                    Spacer()
                    Text("₹1200")
                        .foregroundColor(Color("text-primary"))
                        .bold()
                        .font(.title3)
                        .padding()
                }
                
                HStack {
                    RoundedRectangle(cornerRadius: 12)
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 80)
                        .foregroundColor(Color("bg-secondary"))
                        .overlay (
                            Text("🤪")
                                .font(.largeTitle)
                        )
                        .overlay (
                            RoundedRectangle(cornerRadius: 12)
                                .trim(from: 0, to: 0.75)
                                .rotation(Angle(degrees: -90))
                                .stroke(lineWidth: 3)
                                .aspectRatio(1, contentMode: .fit)
                                .frame(height: 78)
                                .foregroundColor(Color("yellow-medium"))
                        )
                    
                    VStack (alignment: .leading
                    ) {
                        Text("Netflix")
                            .font(.headline)
                            .foregroundColor(Color("text-primary"))
                        Text("21/04/21 6:33PM")
                            .foregroundColor(Color("text-secondary"))
                            .font(.caption2)
                    }
                    Spacer()
                    Text("₹1200")
                        .foregroundColor(Color("text-primary"))
                        .bold()
                        .font(.title3)
                        .padding()
                }
                
                HStack {
                    RoundedRectangle(cornerRadius: 12)
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 80)
                        .foregroundColor(Color("bg-secondary"))
                        .overlay (
                            Text("🤪")
                                .font(.largeTitle)
                        )
                        .overlay (
                            RoundedRectangle(cornerRadius: 12)
                                .trim(from: 0, to: 0.75)
                                .rotation(Angle(degrees: -90))
                                .stroke(lineWidth: 3)
                                .aspectRatio(1, contentMode: .fit)
                                .frame(height: 78)
                                .foregroundColor(Color("yellow-medium"))
                        )
                    
                    VStack (alignment: .leading
                    ) {
                        Text("Netflix")
                            .font(.headline)
                            .foregroundColor(Color("text-primary"))
                        Text("21/04/21 6:33PM")
                            .foregroundColor(Color("text-secondary"))
                            .font(.caption2)
                    }
                    Spacer()
                    Text("₹1200")
                        .foregroundColor(Color("text-primary"))
                        .bold()
                        .font(.title3)
                        .padding()
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: isExpanded ? CGFloat(0) : .none)
            .clipped()
        }

    }
}

struct expandingCarouselTestView_Previews: PreviewProvider {
    static var previews: some View {
        expandingCarouselTestView()
    }
}
