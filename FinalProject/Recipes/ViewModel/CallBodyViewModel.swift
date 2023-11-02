//
//  CallBodyViewModel.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/23/23.
//

import Foundation

class AppViewModel: ObservableObject {
    
    @Published var call = CallBody()
   
    
    func getCallFromUrl(url: String) async -> () {
        do {
            let url = URL(string: url)!
            let (data, _) = try await URLSession.shared.data(from: url)
            call = try JSONDecoder().decode(CallBody.self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func formatUrlString(mealType: String, cuisineType: String, searchValue: String)  -> String{
        
        let endUrl = "&app_id=243ff47b&app_key=71457942cb487b513a099f36f458b05a"
        let baseUrl = "https://api.edamam.com/api/recipes/v2?type=public"
        
        if (mealType.isEmpty && cuisineType.isEmpty){
            return("\(baseUrl)&q=\(searchValue)\(endUrl)")
        } else if (cuisineType.isEmpty){
            return("\(baseUrl)&q=\(searchValue)\(endUrl)&mealType=\(mealType)")
        } else if(mealType.isEmpty) {
            return("\(baseUrl)&q=\(searchValue)\(endUrl)&cuisineType=\(cuisineType)")
        } else {
            return("\(baseUrl)&q=\(searchValue)\(endUrl)&cuisineType=\(cuisineType)&mealType=\(mealType)")
        }
        
        
    }
    
    
    @MainActor
    func getCall(searchValue: String, mealType: String, cuisineType: String) async -> () {
        
            let urlString = formatUrlString(mealType: mealType, cuisineType: cuisineType, searchValue: searchValue)
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
