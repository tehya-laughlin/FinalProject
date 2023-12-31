//
//  RecipeCardView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/30/23.
//

import SwiftUI

struct RecipeCardView: View {
    
    var recipe: Recipe
    var size: CGSize
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width:size.width * 0.8, height:96)
                .foregroundColor(.white)

            HStack{
                AsyncImage(url: URL(string: recipe.images?.SMALL?.url ?? "https://roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg"))
                    .frame(width: size.width*0.4, height: 96)
                    .clipped()

                VStack{
                    Text("\(recipe.label ?? "No Label")")
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
        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
    }
}
