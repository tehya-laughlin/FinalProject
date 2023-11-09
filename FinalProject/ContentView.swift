//
//  ContentView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/23/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    

    var body: some View {
        GeometryReader{ geometry in
            
            TabView{
                PantryView(size: geometry.size).tabItem{
                    Label("Pantry", systemImage: "cabinet")
                }
                RecipeHomeView(size: geometry.size).tabItem{
                    Label("Recipes", systemImage: "book.pages.fill")
                }
                MealPlanningView().tabItem{
                    Label("Meal Plan", systemImage: "calendar")
                }
                ShoppingListView().tabItem{
                    Label("Shopping List", systemImage: "cart.fill")
                }
            }
        }
        
        
            
    }
        
}

#Preview {
    ContentView()
}
