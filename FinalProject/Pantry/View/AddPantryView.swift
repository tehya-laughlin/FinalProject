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
               
                    await pantryViewModel.getCall(searchValue: searchQuery)
                 
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
                            Task{
                                if(!ingredients.contains(Item(f: ingredient.food.label, id: ingredient.food.foodId))){
                                    print(ingredients.contains(Item( f: ingredient.food.label, id: ingredient.food.foodId)))
                                    addIngredient(im: Item(f: ingredient.food.label, id: ingredient.food.foodId))
                                }
                            }
                        }
                    }
                }
                
                ForEach(pantryViewModel.pantryCall.parsed ?? [IngredientModel(f: IngredientItem())]){
                    ingredient in
                    HStack{
                        Text("\(ingredient.food.knownAs)")
                        Spacer()
                        Button("Add to pantry"){
                            Task{
                                if(!ingredients.contains(Item(f: ingredient.food.label, id: ingredient.food.foodId))){
                                    print(ingredients.contains(Item(f: ingredient.food.label, id: ingredient.food.foodId)))
                                    addIngredient(im: Item(f: ingredient.food.label, id: ingredient.food.foodId))
                                }
                            }
                        }
                    }
                }
                
            }
        }.searchable(text: $searchQuery)
    }
    
    func addIngredient(im: Item) {
        let ingredient = im
        modelContext.insert(ingredient)
    }
}

