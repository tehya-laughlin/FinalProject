//
//  AddPantryView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI
import SwiftData

struct AddPantryView: View {
    
    @Environment(\.modelContext) var modelContext
    @ObservedObject var pantryViewModel: PantryViewModel
    @State var ingredients = [Item]()
    var size: CGSize
    
    @State var searchQuery = ""
    
    var body: some View {
        VStack{
            Button("Load Ingredients") {
                Task{
                    print("pre-call")
                    await pantryViewModel.getCall(searchValue: searchQuery)
                    print("post-call")
                }
            }
            .buttonStyle(CustomButton())
            .frame(width: size.width/2, height: size.height/9)
            .padding(.trailing, 10)
            
            
            List{
                ForEach(pantryViewModel.pantryCall.hints ?? [IngredientModel(f: IngredientItem())]){
                    ingredient in
                    HStack{
                        Text("\(ingredient.food.knownAs)")
                        Spacer()
                        Button("Add to pantry"){
                            addIngredient(im: Item(fid: ingredient.food.foodId, f: ingredient.food.label))
                        }
                    }
                }
                
                ForEach(pantryViewModel.pantryCall.parsed ?? [IngredientModel(f: IngredientItem())]){
                    ingredient in
                    HStack{
                        Text("\(ingredient.food.knownAs)")
                        Spacer()
                        Button("Add to pantry"){
                            addIngredient(im: Item(fid: ingredient.food.foodId, f: ingredient.food.label))
                        }
                    }
                }
                
            }
        }.searchable(text: $searchQuery)
    }
    
    func addIngredient(im: Item) {
        let ingredient = im
        modelContext.insert(ingredient)
        ingredients = [ingredient]
    }
}

