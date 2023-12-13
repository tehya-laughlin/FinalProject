//
//  DayPlanView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI

struct DayPlanView: View {
    
    @Environment(\.modelContext) var modelContext
    @Bindable var dayPlan: DayPlan
    @ObservedObject private var mealPlanViewModel = MealPlanViewModel()
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
    
                List{
                    ForEach(dayPlan.recipes){ recipe in
                        VStack{
                            Button("Load"){
                                Task{
                                    await mealPlanViewModel.getOneRecipeByUrl(recipe: recipe)
                                }
                            }
                            .buttonStyle(CustomButton())
                            NavigationLink(destination: RecipeDetailView(size: geometry.size, recipeInfo: mealPlanViewModel.oneRecipe)) {
                                CollectionRecipeCardView(recipe: recipe, size: geometry.size)
                            }
                            
                        }.errorAlert(error: $mealPlanViewModel.error)
                        
                    }.onDelete(perform: deleteRecipeInDayPlan)
                        .listRowSeparator(.hidden)
                    
                }
                .listStyle(.plain)
            }
            .navigationTitle("\(dayPlan.name)")
            .toolbar{
                NavigationLink(destination: RecipeHomeView(size: geometry.size)){
                    Image(systemName: "plus")
                        .foregroundColor(Color("Main"))
                        .scaleEffect(CGSize(width: 1.3, height: 1.3))
                }
            }
        }
    }

    // MOVE ME TO A VIEW MODEL!!!!!
    func deleteRecipeInDayPlan(_ indexSet: IndexSet) {
        for index in indexSet {
            dayPlan.recipes.remove(at: index)
        }
    }
}




