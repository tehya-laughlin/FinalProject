//
//  RecipeModel.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/23/23.
//

import Foundation
import SwiftData

struct CallBody: Codable {
    
    var from: Int?
    var to: Int?
    var count: Int?
    var _links: Link2?
    var hits: [RecipeInfo]?
    
    init(){
        from = 0
        to = 0
        count = 0
        _links = Link2(next: LinkInfo(title:"", href:""))
        hits = []
    }
}

class RecipeInfo: Codable, Identifiable {
    var id: Int { return UUID().hashValue }
    var recipe: Recipe?
    var _links: Links?
}


struct Recipe: Codable, Identifiable {
    var id:  Int { return UUID().hashValue }
    
    var uri: String?
    var label: String?
    var image: String?
    var images: Images?
    var source: String?
    var url: String?
    var shareAs: String?
    var yield: Int?
    var dietLabels: [String]?
    var healthLabels: [String]?
    var cautions: [String]?
    var ingredientLines: [String]?
    var ingredients: [Ingredient]?
    var calories: Double?
    var totalCO2Emissions: Double?
    var co2EmissionsClass: String?
    var totalWeight: Double?
    var totalTime: Int?
    var cuisineType: [String]?
    var mealType: [String]?
    var dishType: [String]?
    var totalNutrients: Nutrients?
    var totalDaily: Nutrients?
    //var digest: [NutrientDigest]?
    
}

struct Links: Codable {
    var linkInfo: LinkInfo
    enum CodingKeys: String, CodingKey {
        case linkInfo = "self"
    }
}

struct Link2: Codable {
    var next: LinkInfo?
}

struct LinkInfo: Codable {
    var title: String?
    var href: String?
}

struct Nutrients: Codable {
    var ENERC_KCAL: Nutrient?
    var FAT: Nutrient?
    var FASAT: Nutrient?
    var FATRN: Nutrient?
    var CHOCDF: Nutrient?
    var FIBTG: Nutrient?
    var SUGAR: Nutrient?
    var PROCNT: Nutrient?
    var CHOLE: Nutrient?
    var NA: Nutrient?
}

struct Nutrient: Codable {
    var uri: String?
    var label: String?
    var quantity: Double?
    var unit: String?
}

struct NutrientDigest: Codable {
    var label: String?
    var tag: String?
    var schemaOrgTag: String?
    var total: Double?
    var hasRDI: Bool?
    var daily: Double?
    var unit: String?
    var sub: [NutrientDigest]?
}


struct Ingredient: Codable, Identifiable {
    var id:  Int { return UUID().hashValue }
    var text: String?
    var quantity: Double?
    var measure: String?
    var food: String?
    var weight: Double?
    var foodCategory: String?
    var foodID: String?
    var image: String?
    
    init(){
        text = ""
    }
    
}

struct Images: Codable {
    var THUMBNAIL: ImageInfo?
    var SMALL: ImageInfo?
    var REGULAR: ImageInfo?
    var LARGE: ImageInfo?
}

struct ImageInfo: Codable {
    var url: String
    var width: Int
    var height: Int
}




