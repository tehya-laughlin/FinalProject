//
//  CollectionModel.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/2/23.
//

import Foundation
import SwiftData

@Model
class Collection: Identifiable {
    
    var id: Int { return UUID().hashValue }
    var name: String
    @Relationship(deleteRule: .cascade) var collection = [RecipeItem]()
    
    init(name: String = ""){
        self.name = name
    }
    
}

@Model
class RecipeItem {
    var label: String
    var url: String
    
    init(label: String = "", url:String = "") {
        self.label = label
        self.url = url
    }
    
}

