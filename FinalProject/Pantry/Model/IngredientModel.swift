//
//  IngredientModel.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/30/23.
//

import Foundation
import SwiftData

struct IngredientQueryBody: Codable {
    
    var text: String?
    var parsed: [IngredientModel]?
    var hints: [IngredientModel]?
    
    
    init(){
        text = ""
        parsed = []
        hints = []
    }
    
}

class IngredientModel: Codable, Identifiable {
    
    var food: IngredientItem
    var id: Int { return UUID().hashValue }
    
    init(f: IngredientItem = IngredientItem()){
        food = f
    }
    
}

class IngredientItem: Codable, Identifiable {
    
    var foodId: String
    var label: String
    var knownAs: String
    var id: Int { return UUID().hashValue }
    
    init(f: String = "", l: String = "", k: String = ""){
        foodId = f
        label = l
        knownAs = k
    }
    
}


