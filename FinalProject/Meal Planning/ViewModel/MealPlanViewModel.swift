//
//  MealPlanViewModel.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 12/5/23.
//

import Foundation
import SwiftData

class MealPlanViewModel: ObservableObject {
    @Published var oneRecipe = RecipeInfo()
   
    func getOneRecipeByUrl(url1: String) async -> () {
        do {
            print(url1)
            let url = URL(string: url1)!
            let (data, _) = try await URLSession.shared.data(from: url)
            oneRecipe = try JSONDecoder().decode(RecipeInfo.self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
}
