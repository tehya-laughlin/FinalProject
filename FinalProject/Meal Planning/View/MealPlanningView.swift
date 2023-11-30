//
//  MealPlanningView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI
import SwiftData

struct MealPlanningView: View {
    @Environment(\.modelContext) var modelContext
    @Query var mealPlan: [MealPlan]
    
    @State private var mealPlanActivated = UserDefaults.standard.bool(forKey: "mealPlanActive")
    
    var size: CGSize
    
    var body: some View {
        NavigationStack{
            
            VStack{
                if(!mealPlanActivated){
                    VStack{
                        Text("Click above to create a meal plan")
                            .font(.title3)
                            .padding(.top, 64)
                        Image("Calendar")
                            .resizable()
                            .scaleEffect(CGSize(width: 0.7, height: 0.5))
                            .offset(CGSize(width: 0.0, height: -70.0))
                        Spacer()
                    }
                    
                }
                WeekPlanView(size: size)
            }
            .navigationTitle("Meal Plan")
            .toolbar {
                if(mealPlanActivated){
                    Button("Delete plan", systemImage: "trash"){
                        do {
                            try modelContext.delete(model: MealPlan.self)
                        } catch {
                            print("Did not delete meal plan")
                        }
                        
                        mealPlanActivated = false
                        UserDefaults.standard.set(self.mealPlanActivated, forKey: "mealPlanActive")
                    }.labelStyle(.titleAndIcon)
                } else {
                    Button("Make plan", systemImage: "plus"){
                        addMealPlan(mealActive: mealPlanActivated)
                        mealPlanActivated = true;
                        UserDefaults.standard.set(self.mealPlanActivated, forKey: "mealPlanActive")
                    }
                    .labelStyle(.titleAndIcon)
                }
                
            }
            
            
        }
    }
    
    func addMealPlan(mealActive: Bool) {
        if(!mealActive){
            let mealPlan = MealPlan()
            modelContext.insert(mealPlan)
        }
    }
}


