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
    @State var collections = [Collection]()
    
    var body: some View{
     
        NavigationStack(path: $collections){
            
            CollectionListView()
                .navigationTitle("Collections")
                .navigationDestination(for: Collection.self, destination: CollectionCardView.init)
                .toolbar {
                    Button("Add Collection", systemImage: "plus", action: addCollection)
                }
            
            
        }
        
    }
    
    func addCollection() {
        let collection = Collection()
        modelContext.insert(collection)
        collections = [collection]
    }
    
}

#Preview {
    AllCollectionsView()
        .modelContainer(for: Collection.self, inMemory: true)
       
}
