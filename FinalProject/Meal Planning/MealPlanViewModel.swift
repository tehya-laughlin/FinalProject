//
//  MealPlanViewModel.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 12/5/23.
//

import Foundation
import SwiftData

class MealPlanViewModel: ObservableObject {
    
    enum Error: LocalizedError {
        case titleEmpty
        
        var errorDescription: String? {
            switch self {
            case .titleEmpty:
                return "An error occured"
            }
        }
        
        var recoverySuggestion: String? {
            switch self {
            case .titleEmpty:
                return "Article publishing failed due to api error"
            }
        }
    }
    
    @Published var title: String = ""
    @Published var error: Swift.Error?

    func publish() {
        error = Error.titleEmpty
    }
    
    @Published var oneRecipe = RecipeInfo()
   
    func getOneRecipeByUrl(recipe: RecipeItem) async -> () {
        do {
            let url1 = recipe.selfLink
            guard let url = URL(string: url1) else {
                return
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            oneRecipe = try JSONDecoder().decode(RecipeInfo.self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
            self.publish()
        }
    }
    
}
