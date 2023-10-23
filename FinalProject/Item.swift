//
//  Item.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/23/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
