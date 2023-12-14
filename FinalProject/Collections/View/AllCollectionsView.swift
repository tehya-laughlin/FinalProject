//
//  CollectionView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI
import SwiftData

struct AllCollectionsView: View {
    
    @State var isNewCollectionSelected = false
    
    @Environment(\.modelContext) private var context
    @State private var path = [CollectionItem]()
    
    var body: some View {
        
        NavigationStack(path: $path){
            CollectionListView()
                .navigationTitle("Collections")
                .toolbar {
                    Button {
                        isNewCollectionSelected.toggle()
                        saveNewItem()
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
                .navigationDestination(for: CollectionItem.self, destination: CollectionCardView.init)
        }
    }
    
    func saveNewItem() {
        let newCollectionItem = CollectionItem(name: "New")
        context.insert(newCollectionItem)
        path = [newCollectionItem]
    }
}

