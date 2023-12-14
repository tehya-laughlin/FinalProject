//
//  CollectionCardView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/4/23.
//

import SwiftUI
import SwiftData

struct CollectionCardView: View {

    @Bindable var collection: CollectionItem
    
    var body: some View {
        GeometryReader{ geometry in
            VStack {
                VStack(alignment: .leading){
                    Text("Collection Name")
                        .frame(alignment: .leading)
                        .font(.subheadline)
                    TextField("Name", text: $collection.name)
                        .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 0))
                        .border(Color("Secondary"), width: 2)
                }
                
                List{
                    ForEach(collection.collection){ recipe in
                        VStack{
                            NavigationLink(destination: CollectionRecipeDetailView(size: geometry.size, recipe: recipe)) {
                                CollectionRecipeCardView(recipe: recipe, size: geometry.size)
                            }
                        }
                    }.onDelete(perform: deleteRecipe)
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                
            }
            .padding()

        }
    }
    
    
    func deleteRecipe(_ indexSet: IndexSet) {
        for index in indexSet {
            collection.collection.remove(at: index)
        }
    }
    
}

