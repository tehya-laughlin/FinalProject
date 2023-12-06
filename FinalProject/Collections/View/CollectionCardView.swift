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
                VStack(alignment: .leading){
                   
                    
                    Text("Collection Name")
                        .frame(alignment: .leading)
                        .font(.subheadline)
                    TextField("Name", text: $collections.name)
                        .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 0))
                        .border(Color("Secondary"), width: 2)
                    

                        
                }
                    
                
                List{
                    ForEach(collections.collection){ recipe in
                            Button("Load"){
                                Task{
                                    await collectionViewModel.getOneRecipeByUrl(url1: recipe.selfLink)
                                }
                            }
                            .buttonStyle(CustomButton())
                            NavigationLink(destination: RecipeDetailView(size: geometry.size, recipeInfo: collectionViewModel.oneRecipe)) {
                                CollectionRecipeCardView(recipe: recipe, size: geometry.size)
                            }
                    }.onDelete(perform: deleteRecipe)
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                
            }
            .padding()
            .toolbar{
                if !collections.name.isEmpty {
                    Button {
                        saveNewItem(collection: collections)
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Save")
                    }
                    .buttonStyle(CustomButton())
                    .padding()
                }
            }
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

