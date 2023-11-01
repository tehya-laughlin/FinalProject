//
//  ContentView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/23/23.
//

import SwiftUI

struct ContentView: View {
    
  

    var body: some View {
        GeometryReader{ geometry in
            
            TabView{
                PantryView().tabItem{
                    Label("Pantry", systemImage: "globe")
                }
                RecipeHomeView(size: geometry.size).tabItem{
                    Label("Recipes", systemImage: "globe")
                }
                MealPlanningView().tabItem{
                    Label("Meal Plan", systemImage: "globe")
                }
                ShoppingListView().tabItem{
                    Label("Shopping List", systemImage: "globe")
                }
            }
        }
        
        
            
    }
        
}

#Preview {
    ContentView()
}
