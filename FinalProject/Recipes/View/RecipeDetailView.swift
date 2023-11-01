//
//  RecipeDetailView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var size: CGSize
    //var recipe: Recipe
    @State var pageToggle: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    AsyncImage(url: URL(string: "https://roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg"))
                        .frame(width: size.width, height: 280)
                        .clipped()
                    
                    Button("Change pages"){
                        pageToggle.toggle()
                    }
                    .position(x:size.width/2, y: 280)
                        
                    
                }
                .frame(width: size.width, height: 328)
                .position(x:size.width/2, y:-40)
                
                VStack{
                    Text("Title")
                        .font(.title)
                        .position(x:30, y:-180)
                        .padding(.leading, 30)
                    
                    if(!pageToggle){
                        Text("Recipe Ingredients")
                    } else {
                        Text("Recipe Nutrition")
                            .position(x: 30, y: -150)
                            .padding(.leading, 30)
                    }
                }
            
                
                
            }
        }.toolbar {
            ToolbarItem{
                ZStack{
                    Button(){
                        //some function to open alert to give option of adding to collection or meal plan
                    }label:{
                        ZStack{
                            Circle().frame(width:45, height: 45)
                                .foregroundStyle(.regularMaterial)
                            Image(systemName: "plus")
                                .foregroundColor(Color("Main"))
                                .scaleEffect(CGSize(width: 1.3, height: 1.3))
                        }
                    }
                    
                }
            }
        }.toolbarBackground(.hidden)
            
            
    }
}

#Preview {
    GeometryReader{ geomtry in
        RecipeDetailView(size: geomtry.size)
    }
}
