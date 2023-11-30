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
    
    @ObservedObject var collectionViewModel = CollectionViewModel()
    
    
    var body: some View {
        
        VStack{
            
            List{
                ForEach(dayPlan.recipes){ recipe in
                    Button("Load this recipe"){
                        Task{
                            await collectionViewModel.getOneRecipeByUrl(url1: recipe.selfLink)
                        }
                    }
                    .buttonStyle(CustomButton())
                    NavigationLink(destination: RecipeDetailView(size: size, recipe: collectionViewModel.oneRecipe.recipe ?? Recipe())){
                        CollectionRecipeCardView(recipe: recipe, size: size)
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
        }
    }
    
}




