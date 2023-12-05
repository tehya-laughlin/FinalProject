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
    @Query var mealPlans: [MealPlan]
    var size: CGSize
    
    var body: some View {
        NavigationStack{
            
            
            if(!mealPlans.isEmpty){
                    ScrollView{
                        ForEach(mealPlans[0].weekPlan){ dayPlan in
                            NavigationLink(destination: DayPlanView(size: size, dayPlan: dayPlan)){
                                DayCard(size: size, dayPlan: dayPlan)
                            }
                        }
                    }
                }
            
            
        }
        
    }
}

