//
//  Item.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/9/23.
//

import Foundation
import SwiftData

@Model
class Item: Identifiable, Equatable{
    @Attribute(.unique) var id: String
    var food: String
    
    init(f: String = "", id: String) {
        food = f
        self.id = id
    }
}
