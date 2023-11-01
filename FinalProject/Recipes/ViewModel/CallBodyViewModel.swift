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
    
    
    @MainActor
    func getCall(searchValue: String) async -> () {
            do {
                let url = URL(string: "https://api.edamam.com/api/recipes/v2?type=public&q=\(searchValue)&app_id=243ff47b&app_key=71457942cb487b513a099f36f458b05a")!
                let (data, _) = try await URLSession.shared.data(from: url)
                call = try JSONDecoder().decode(CallBody.self, from: data)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        

    }
    
    
}
