//
//  CollectionCardView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/4/23.
//

import SwiftUI
import SwiftData

struct CollectionCardView: View {
    
    @Environment(\.modelContext) private var context
       @Environment(\.presentationMode) var presentationMode
    
    @Bindable var collections: CollectionItem
    
    @ObservedObject var collectionViewModel = CollectionViewModel()
    
       
    var body: some View {
        GeometryReader{ geometry in
            VStack {
                if !collections.name.isEmpty {
                    Button {
                        saveNewItem(collection: collections)
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Save")
                    }
                }
                
                Text("Collection Name")
                    .frame(alignment: .leading)
                TextField("Name", text: $collections.name)
                    .padding()
                    
                
                List{
                    ForEach(collections.collection){ recipe in
                        NavigationLink(destination: RecipeDetailView(size: geometry.size, recipeInfo: recipe)) {
                            CollectionRecipeCardView(recipe: recipe, size: geometry.size)
                        }
                    }.onDelete(perform: deleteRecipe)
                }
                .listStyle(.plain)
                
            }
            .padding()
        }
       }
    
    func saveNewItem(collection: CollectionItem) {
        let newCollectionItem = collection
        context.insert(newCollectionItem)
    }
    
    func deleteRecipe(_ indexSet: IndexSet) {
        for index in indexSet {
            collections.collection.remove(at: index)
        }
    }
    
    
}

