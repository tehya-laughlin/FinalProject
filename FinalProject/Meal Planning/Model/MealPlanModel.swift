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
    var orderNum: Int = 0
    @Relationship(deleteRule: .cascade) var recipes = [RecipeItem]()
    
    
    init(name: String, initial: String, orderNum: Int = 0){
        self.name = name
        self.initial = initial
        self.orderNum = orderNum
    }
}
