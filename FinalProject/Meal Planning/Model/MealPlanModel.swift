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
        weekPlan = [DayPlan(name: "Monday"), DayPlan(name: "Tuesday"), DayPlan(name: "Wednesday"), DayPlan(name: "Thursday"), DayPlan(name: "Friday"), DayPlan(name: "Saturday"), DayPlan(name: "Sunday")]
    }
    
}

@Model
class DayPlan {
    var name: String
    var recipes: [RecipeItem]
    
    init(name: String, recipes: [RecipeItem] = []){
        self.name = name
        self.recipes = recipes
    }
}
