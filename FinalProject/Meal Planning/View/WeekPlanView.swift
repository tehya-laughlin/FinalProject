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
        List{
            ForEach(mealPlans){ dayPlan in
                NavigationLink(destination: DayPlanView(dayPlan: dayPlan)){
                    DayCard(size: size, dayPlan: dayPlan)
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
 
        
    }
}

