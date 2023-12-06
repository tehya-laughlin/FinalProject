//
//  CollectionModel.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/2/23.
//

import Foundation
import SwiftData

@Model
class CollectionItem: Identifiable {
    
    var id: Int { return UUID().hashValue }
    var name: String
    @Relationship(deleteRule: .cascade) var collection = [RecipeItem]()
    
    init(name: String = ""){
        self.name = name
    }
    
}

@Model
class RecipeItem: Identifiable {
    var id: Int { return UUID().hashValue }
    var label: String
    var imageLink: String
    var selfLink: String
    
    init(label: String = "", imageLink :String = "", selfLink: String = "") {
        self.label = label
        self.imageLink = imageLink
        self.selfLink = selfLink
    }
    
}

/*
@Model
class RecipeItem {
    var label: String
    var imageLink: String
    var selfLink: String

    var recipeRegularImage: String
    var recipeYield: Int
    var recipeIngredients: [Ingredient]
    var recipeCalories: Double
    var recipeTotalTime: Int
    var recipeDietLabels: [String]
    var recipeHealthLabels: [String]
    var recipeLinkRecipe: String
    
    init(label: String, imageLink: String, selfLink: String, reg: String , yield: Int, ingredients: [Ingredient], calories: Double, totalTime: Int, dietLabels: [String], healthLabels: [String], recipeLink: String) {
        self.label = label
        self.imageLink = imageLink
        self.selfLink = selfLink
        recipeRegularImage = reg
        recipeYield = yield
        recipeIngredients = ingredients
        recipeCalories = calories
        recipeDietLabels = dietLabels
        recipeHealthLabels = healthLabels
        recipeLinkRecipe = recipeLink
        recipeTotalTime = totalTime
    }
    
}
*/
