//
//  DayPlanView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI

struct DayPlanView: View {
    
    @Environment(\.modelContext) var modelContext
    var size: CGSize
    
    
    @Bindable var dayPlan: DayPlan
    //@Bindable var mealPlan: MealPlan
    
    @ObservedObject var mealPlanViewModel = MealPlanViewModel()
    
    
    var body: some View {
        
        VStack{
            
            List{
                ForEach(dayPlan.recipes){ recipe in
                
                    NavigationLink(destination: RecipeDetailView(size: size, recipeInfo: recipe)) {
                        
                        CollectionRecipeCardView(recipeInfo: recipe, size: size)
           
                    }
                    
                }.onDelete(perform: deleteRecipeInDayPlan)
            }
            .listStyle(.plain)
        }
        .navigationTitle("\(dayPlan.name)")
        
    }
    
    
    // MOVE ME TO A VIEW MODEL!!!!!
    func deleteRecipeInDayPlan(_ indexSet: IndexSet) {
        for index in indexSet {
            let recipe = dayPlan.recipes[index]
            modelContext.delete(recipe)
            //dayPlan.remove(at: index)
        }
    }
    
}




