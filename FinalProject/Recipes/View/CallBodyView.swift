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
                            let lnk = appViewModel.call._links ?? Link2(next: LinkInfo(title: "", href:""))
                            await appViewModel.getCallFromUrl(url1: (lnk.next?.href ?? ""))
                        }
                    }
                    .buttonStyle(CustomButton())
                    .frame(width: size.width/3)
                    .padding(.leading, 10)
                }
            }
            
            List{
                ForEach(appViewModel.call.hits ?? [RecipeInfo(recipe: Recipe())]) { recipeInfo in
                    NavigationLink(destination: RecipeDetailView(size:size,recipeInfo: recipeInfo)){
                        RecipeCardView(recipe: recipeInfo.recipe ?? Recipe(), size: size)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .frame(height:size.height*0.62)
            
        }
        
        
    }
    
}

