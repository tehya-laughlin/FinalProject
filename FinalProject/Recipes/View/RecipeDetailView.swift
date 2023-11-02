//
//  RecipeDetailView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var size: CGSize
    var recipe: Recipe
    @State var pageToggle: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    AsyncImage(url: URL(string: recipe.images?.REGULAR?.url ?? "https://roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg"))
                        .scaleEffect(CGSize(width: 1.4, height: 1.4))
                        .frame(width: size.width, height: 256)
                        .clipped()
                        .edgesIgnoringSafeArea(.top)
                    
                    Button(){
                        pageToggle.toggle()
                    } label: {
                        Text("Change to \(pageToggle ? "Ingredients" : "Nutrients" )")
                            .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
                            .background(Color.white)
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .inset(by: 1)
                                    .stroke(Color("Main"), lineWidth: 2)
                            )
                            
                           
                    }
                    .offset(CGSize(width: 0.0, height: 42.0))
                        
                    
                }
                .frame(width: size.width, height: 256)
               
                
                VStack(alignment: .leading){
                    Text("\(recipe.label)")
                        .font(.title)
                        .offset(CGSize(width: 0.0, height: -50.0))
                        .padding(.leading, 30)
                    
                    Text("yield: \(recipe.yield ?? 0)")
                        .font(.headline)
                        .padding(.leading, 30)
                        .offset(CGSize(width: 0.0, height: -45.0))
                       
                    
                    if(!pageToggle){
                        VStack(alignment: .leading){
                            
                            Text("Ingredients")
                                .font(.headline)
                                .padding(.leading, 30)
                            
                            List(recipe.ingredients ?? [Ingredient()]){
                                ingredient in
                                
                                Text("\(ingredient.text)")
                                
                            }
                          
                            
                            Spacer()
                        }
                        .frame(width: size.width, alignment: .leading)
                        .offset(CGSize(width: 0.0, height: -40.0))
                        
                    } else {
                        VStack(alignment: .leading){
                            
                            Text("Nutrients")
                                .font(.headline)
                                .padding(.leading, 30)
                            
                          
                            
                            Spacer()
                        }
                        .frame(width: size.width, alignment: .leading)
                        .offset(CGSize(width: 0.0, height: -40.0))
                       
                    }
                }
                .frame(height: size.height * 0.69)
                
                
           
                
                
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
        }.toolbarBackground(.ultraThinMaterial, for: .navigationBar)
            
            
    }
}


