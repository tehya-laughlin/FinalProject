//
//  MealPlanModel.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/27/23.
//

import Foundation
import SwiftData

@Model
class DayPlan: Identifiable {
    var id: Int { return UUID().hashValue }
    var name: String
    var initial: String
    @Relationship(deleteRule: .cascade) var recipes = [RecipeItem]()
    
    
    init(name: String, initial: String){
        self.name = name
        self.initial = initial
    }
}
