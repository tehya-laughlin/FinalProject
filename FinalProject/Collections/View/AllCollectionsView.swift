//
//  CollectionView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI
import SwiftData

struct AllCollectionsView: View {
    
    @Environment(\.modelContext)  var modelContext
    @State var collections = [CollectionItem]()
    
    var body: some View {
     
        NavigationStack(path: $collections){
            
            CollectionListView()
                .navigationTitle("Collections")
                .navigationDestination(for: CollectionItem.self, destination: CollectionCardView.init)
                .toolbar {
                    Button("Add Collection", systemImage: "plus", action: addCollection)
                }
            
            
        }
        
    }
    
    func addCollection() {
        let collection = CollectionItem()
        modelContext.insert(collection)
        collections = [collection]
    }
    
}

#Preview {
    AllCollectionsView()
        .modelContainer(for: CollectionItem.self, inMemory: true)
       
}
