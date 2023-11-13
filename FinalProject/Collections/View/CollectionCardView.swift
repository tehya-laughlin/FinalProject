//
//  CollectionCardView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/4/23.
//

import SwiftUI

struct CollectionCardView: View {
    
    @Bindable var collection: CollectionItem
    
    var body: some View {
        TextField("Name", text: $collection.name)
    }
    
    
}

