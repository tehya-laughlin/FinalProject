//
//  WeekPlanView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI
import SwiftData


struct WeekPlanView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var mealPlans: [DayPlan]
    var size: CGSize
    
    var body: some View {
        VStack{
            let sortedMealPlans = mealPlans.sorted {
                $0.orderNum < $1.orderNum
            }
            
            List{
                ForEach(sortedMealPlans){ dayPlan in
                    NavigationLink(destination: DayPlanView(dayPlan: dayPlan)){
                        DayCard(size: size, dayPlan: dayPlan)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            
        }
    }
}

