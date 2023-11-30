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
                AllCollectionsView().tabItem{
                    Label("Collections", systemImage: "folder")
                }
                RecipeHomeView(size: geometry.size).tabItem{
                    Label("Recipes", systemImage: "book.pages.fill")
                }
                MealPlanningView(size: geometry.size).tabItem{
                    Label("Meal Plan", systemImage: "calendar")
                }
                PantryView(size: geometry.size).tabItem{
                    Label("Shopping List", systemImage: "cart.fill")
                }
                
            }
        }
        
        
            
    }
        
}

#Preview {
    ContentView()
}
