//
//  InPantryView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI
import SwiftData

struct InPantryView: View {
    @Environment(\.modelContext) var modelContext
    @ObservedObject var pantryViewModel: PantryViewModel
    @Query var ingredients: [Item]
    
    var size: CGSize
    
    var body: some View {
        NavigationView{
            VStack{
                
                if(ingredients.isEmpty){
                    VStack{
                        Text("Your pantry is empty")
                            .font(.title3)
                        Image("Pantry")
                            .resizable()
                            .frame(width: size.width)
                    }
                    .padding(.top, 64)
                }
                List{
                    ForEach(ingredients){
                        ingredient in
                        Text("\(ingredient.food)")
                    }
                }
                
            }
        }
    }
    
    func deleteIngredeitns(_ indexSet: IndexSet) {
        for index in indexSet {
            let ingredient = ingredients[index]
            modelContext.delete(ingredient)
        }
    }
    
}

