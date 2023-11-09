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
    
   /* enum CodingKeys: CodingKey {
        case food
    }*/
    
    var food: IngredientItem
    var id: Int { return UUID().hashValue }
    
    init(f: IngredientItem = IngredientItem()){
        food = f
    }
    
   /* required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        food = try container.decode(IngredientItem.self, forKey: .food)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(food, forKey: .food)
    }*/
}


class IngredientItem: Codable, Identifiable {
    
   /* enum CodingKeys: CodingKey {
        case foodId
        case label
        case knownAs
    }*/
    
    var foodId: String
    var label: String
    var knownAs: String
    var id: Int { return UUID().hashValue }

    init(f: String = "", l: String = "", k: String = ""){
        foodId = f
        label = l
        knownAs = k
    }
    
    /*required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        foodId = try container.decode(String.self, forKey: .foodId)
        label = try container.decode(String.self, forKey: .label)
        knownAs = try container.decode(String.self, forKey: .knownAs)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(foodId, forKey: .foodId)
        try container.encode(label, forKey: .label)
        try container.encode(knownAs, forKey: .knownAs)
    }*/
}


/*@Model
class NutrientsItem: Codable {
    
    enum CodingKeys: CodingKey {
        case food
    }
    
    var ENERC_KCAL: Double
    var PROCNT: Double
    var FAT: Double
    var CHOCDF: Double
    var FIBTG: Double
    
    init(e: Double = 0.0, p: Double = 0.0, fa: Double = 0.0, c: Double = 0.0, fi: Double = 0.0){
        ENERC_KCAL = e
        PROCNT = p
        FAT = fa
        CHOCDF = c
        FIBTG = fi
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        food = try container.decode(IngredientItem.self, forKey: .food)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(food, forKey: .food)
    }
}
*/

