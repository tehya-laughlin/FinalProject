//
//  CollectionListView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/5/23.
//

import SwiftUI
import SwiftData

struct CollectionListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var collections: [CollectionItem]
    
    var body: some View {
        List {
            ForEach(collections) { collection in
                NavigationLink(value: collection) {
                    VStack(alignment: .leading) {
                        Text(collection.name)
                            .font(.headline)
                    }
                }
            }
            .onDelete(perform: deleteCollections)
        }
    }
    
    func deleteCollections(_ indexSet: IndexSet) {
        for index in indexSet {
            let collection = collections[index]
            modelContext.delete(collection)
        }
    }
}


