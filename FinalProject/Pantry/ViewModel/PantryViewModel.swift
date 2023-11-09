//
//  PantryViewModel.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/30/23.
//

import Foundation

class PantryViewModel: ObservableObject {
    
    @Published var pantryCall = IngredientQueryBody()
    
    
    @MainActor
    func getCall(searchValue: String) async -> () {
        
        let urlString = "https://api.edamam.com/api/food-database/v2/parser?app_id=e7f541ab&app_key=34d0cfb1249ca4b08efc4a9e547e09c8&ingr=\(searchValue)&nutrition-type=cooking"
            print(urlString)
            do {
                let url = URL(string: urlString)!
                let (data, _) = try await URLSession.shared.data(from: url)
                print("got data")
                pantryCall = try JSONDecoder().decode(IngredientQueryBody.self, from: data)
                print("decoded")

            } catch {
                print("Error: \(error.localizedDescription)")
            }
        

    }
    
    
    
    
}
