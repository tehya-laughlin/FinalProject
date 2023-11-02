//
//  ApiTextCall.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/23/23.
//

import SwiftUI

struct CallBodyView: View {
    
    @ObservedObject var appViewModel: AppViewModel
    var size: CGSize
    var searchQuery: String
    @Binding  var selectedMealType: FilterMealType
    
    @Binding  var selectedCuisine: FilterCuisineType
    
    @Binding  var selectedDish: FilterDishType
    
    
    var body: some View {
        
        VStack{
            VStack{
                HStack{
                    Button("Load Recipes") {
                        Task{
                            await appViewModel.getCall(searchValue: searchQuery, mealType: selectedMealType.rawValue, cuisineType: selectedCuisine.rawValue, dishType: selectedDish.rawValue)
                        }
                    }
                    .buttonStyle(CustomButton())
                    .frame(width: size.width/3, height: size.height/9)
                    .padding(.trailing, 10)
                    
                    Button("Next Page") {
                        Task {
                            await appViewModel.getCallFromUrl(url1: (appViewModel.call._links!.next?.href!)!)
                        }
                    }
                    .buttonStyle(CustomButton())
                    .frame(width: size.width/3)
                    .padding(.leading, 10)
                }
                Text("\(appViewModel.call.from ?? 0) to \(appViewModel.call.to ?? 0)")
            }
            
            ScrollView{
                Spacer()
                ForEach(appViewModel.call.hits!) { recipeInfo in
                    NavigationLink(destination: RecipeDetailView(size:size, recipe: recipeInfo.recipe!)){
                        RecipeCardView(recipe: recipeInfo.recipe!, size: size)
                    }
                    
                }
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .frame(height:size.height*0.62)
            
        }
        
        
    }
    
}

