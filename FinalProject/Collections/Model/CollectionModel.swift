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
    var collection: [RecipeItem]
    
    init(){
        collection = []
    }
    
    func addItem(newItem: RecipeItem) {
        collection.append(newItem)
    }
    
}

@Model
class RecipeItem: Identifiable {
    
    var id: Int { return UUID().hashValue }
    
    var label: String
    var urlString: String
    var imageUrlString: String
    
    init(label: String = "", urlString: String = "", imageUrlString: String = ""){
        self.label = label
        self.urlString = urlString
        self.imageUrlString = imageUrlString
    }
}
