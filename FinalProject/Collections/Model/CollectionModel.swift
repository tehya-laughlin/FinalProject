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
class RecipeItem {
    var label: String = "No Label"
    var imageLink: String = "https://roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg"
    var selfLink: String = ""

    var recipeRegularImage: String = "https://roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg"
    var recipeYield: Int = 0
    var recipeIngredients: [Ingredient] = []
    var recipeCalories: Double = 0.0
    var recipeTotalTime: Int = 0
    var recipeDietLabels: [String] = ["No Diet Labels"]
    var recipeHealthLabels: [String] = ["No Health Labels"]
    var recipeLinkRecipe: String = "https://google.com"
    
    init(label: String, imageLink: String, selfLink: String, recipeRegularImage: String , recipeYield: Int, recipeIngredients: [Ingredient], recipeCalories: Double, recipeTotalTime: Int, recipeDietLabels: [String], recipeHealthLabels: [String], recipeLinkRecipe: String) {
        self.label = label
        self.imageLink = imageLink
        self.selfLink = selfLink
        self.recipeRegularImage = recipeRegularImage
        self.recipeYield = recipeYield
        self.recipeIngredients = recipeIngredients
        self.recipeCalories = recipeCalories
        self.recipeDietLabels = recipeDietLabels
        self.recipeHealthLabels = recipeHealthLabels
        self.recipeLinkRecipe = recipeLinkRecipe
        self.recipeTotalTime = recipeTotalTime
    }
    
}


