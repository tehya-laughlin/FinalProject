//
//  CollectionRecipeCardView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/15/23.
//

import SwiftUI

struct CollectionRecipeCardView: View {
    
    var recipe: RecipeItem
    var size: CGSize
    
    var body: some View {
        ZStack{
            
            Rectangle()
                .frame(width:size.width * 0.8, height:96)
                .foregroundColor(.white)
                
            
            HStack{
                AsyncImage(url: URL(string: recipe.imageLink))
                    .frame(width: size.width*0.4, height: 96)
                    .clipped()
                
            
                
                VStack{
                    Text("\(recipe.label)")
                        .font(.headline)
                        .foregroundColor(.black)
                }
                .frame(width: size.width*0.4)
                .padding(.leading, 20)
                .padding(.trailing, 10)
                
            }
        }
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 0))
        
        
        
    }
}
