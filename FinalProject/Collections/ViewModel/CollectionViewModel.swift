//
//  CollectionViewModel.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/30/23.
//

import Foundation

class CollectionViewModel: Identifiable, ObservableObject {
    
    @Published var name: String
    @Published var collectionArray: [Recipe]
    
    init(givenName: String){
        self.name = givenName
        collectionArray = []
    }
    
    func addRecipe(recipe: Recipe) {
        collectionArray.append(recipe)
    }
    
    
}
