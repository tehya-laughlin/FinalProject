//
//  Item.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/9/23.
//

import Foundation
import SwiftData

@Model
class Item: Identifiable{
    var id: Int { return UUID().hashValue }
    var foodid: String
    var food: String
    
    init(fid: String = "", f: String = "") {
        foodid = fid
        food = f
    }
}
