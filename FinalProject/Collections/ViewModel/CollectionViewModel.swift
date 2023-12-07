//
//  CollectionViewModel.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/15/23.
//

import Foundation
import SwiftData

class CollectionViewModel: ObservableObject {
    
    @Published var oneRecipe = RecipeInfo()
   
    func getOneRecipeByUrl(url1: String) async -> () {
        do {
            guard let url = URL(string: url1) else {
                return
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            oneRecipe = try JSONDecoder().decode(RecipeInfo.self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    
}
