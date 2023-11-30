//
//  MealPlanModel.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/27/23.
//

import Foundation
import SwiftData

@Model
class MealPlan {
    
    var weekPlan: [DayPlan]

    init(){
        weekPlan = [DayPlan(name: "Monday", initial: "M"), DayPlan(name: "Tuesday", initial: "T"), DayPlan(name: "Wednesday", initial: "W"), DayPlan(name: "Thursday", initial: "Th"), DayPlan(name: "Friday", initial: "F"), DayPlan(name: "Saturday", initial: "Sa"), DayPlan(name: "Sunday", initial: "Su")]
    }
    
}

@Model
class DayPlan {
    var name: String
    var recipes: [RecipeItem]
    var initial: String
    
    init(name: String, initial: String, recipes: [RecipeItem] = []){
        self.name = name
        self.initial = initial
        self.recipes = recipes
    }
}
