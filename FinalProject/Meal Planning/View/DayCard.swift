//
//  DayCard.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/30/23.
//

import SwiftUI

struct DayCard: View {
    var size: CGSize
    
    var dayPlan: DayPlan
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: size.width * 0.8, height:117)
                .foregroundColor(.white)
            
            HStack{
                
                VStack{
                    Text("\(dayPlan.initial)")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                }
                
                VStack(alignment: .leading){
                    
                    ForEach(dayPlan.recipes){ recipe in
                        Text("\(recipe.label)")
                            .font(.caption2)
                            .foregroundStyle(.black)
                    }
                    
                }
                .frame(width: size.width * 0.6)
                
            }
        }
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
    }
    
    
}


