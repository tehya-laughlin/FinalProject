//
//  CallBodyViewModel.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/23/23.
//

import Foundation

class AppViewModel: ObservableObject {
    
    @Published var call = CallBody()
    
    
    func getCallFromUrl(url1: String) async -> () {
        do {
            print(url1)
            let url = URL(string: url1)!
            let (data, _) = try await URLSession.shared.data(from: url)
            call = try JSONDecoder().decode(CallBody.self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    
    
    func formatUrlString(mealType: String, cuisineType: String, searchValue: String, dishType: String)  -> String{
        
        let endUrl = "&app_id=243ff47b&app_key=71457942cb487b513a099f36f458b05a"
        let baseUrl = "https://api.edamam.com/api/recipes/v2?type=public&q=\(searchValue)"
        
        let meal = mealType.isEmpty ? "" : "&mealType=\(mealType)"
        let cuisine = cuisineType.isEmpty ? "" : "&cuisineType=\(cuisineType)"
        let dish = dishType.isEmpty ? "" : "&dishType=\(dishType)"
        
        return("\(baseUrl)\(endUrl)\(cuisine)\(meal)\(dish)")
        
    }
    
    
    @MainActor
    func getCall(searchValue: String, mealType: String, cuisineType: String, dishType: String) async -> () {
        
        let urlString = formatUrlString(mealType: mealType, cuisineType: cuisineType, searchValue: searchValue, dishType: dishType)
            print(urlString)
            do {
                let url = URL(string: urlString)!
                let (data, _) = try await URLSession.shared.data(from: url)
                call = try JSONDecoder().decode(CallBody.self, from: data)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        

    }
    
    
}
