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
                            .scaleEffect(CGSize(width: 0.7, height: 0.9))
                       
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
                            try modelContext.delete(model: DayPlan.self)
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
            let monday = DayPlan(name: "Monday", initial: "M")
            modelContext.insert(monday)
            let tuesday = DayPlan(name: "Tuesday", initial: "T")
            modelContext.insert(tuesday)
            let wednesday = DayPlan(name: "Wednesday", initial: "W")
            modelContext.insert(wednesday)
            let thursday = DayPlan(name: "Thursday", initial: "Th")
            modelContext.insert(thursday)
            let friday = DayPlan(name: "Friday", initial: "F")
            modelContext.insert(friday)
            let saturday = DayPlan(name: "Saturday", initial: "Sa")
            modelContext.insert(saturday)
            let sunday = DayPlan(name: "Sunday", initial: "Su")
            modelContext.insert(sunday)
        }
    }
}


