//
//  IngredientRowView.swift
//  CookBook
//
//  Created by Tehya Laughlin on 12/13/23.
//

import SwiftUI
import SwiftData

struct IngredientRowView: View {
    @Environment(\.modelContext) var modelContext
    
    var ingredient: IngredientModel
    @Query var ingredients: [Item]
    @State var change = true
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color("Background"))
            
            HStack{
                Text("\(ingredient.food.label)")
                    .padding(.leading, 20)
                Spacer()
                
                Button{
                    Task{
                        if(!ingredients.contains(Item(f: ingredient.food.label, id: ingredient.food.foodId))){
                            addIngredient(im: Item(f: ingredient.food.label, id: ingredient.food.foodId))
                            change = false
                        }
                    }
                } label: {
                    Image(systemName: change ? "plus" : "checkmark")
                        .foregroundColor(Color("Main"))
                        .scaleEffect(CGSize(width: 1, height: 1))
                        .contentTransition(.symbolEffect(.replace))
                }
                .padding(.trailing, 20)
            }
        }
    }
    
    func addIngredient(im: Item) {
        let ingredient = im
        modelContext.insert(ingredient)
    }
}


