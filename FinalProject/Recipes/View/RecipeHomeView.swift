//
//  RecipeHomeView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI

struct RecipeHomeView: View {
    
    @State var searchQuery: String = ""
    var size: CGSize
    
    var body: some View {
        NavigationView {
            
            VStack{
                
                if(searchQuery.isEmpty){
                    VStack{
                        
                        Text("Collections")
                        
                        HStack {
                            NavigationLink("This goes to collections") {
                                CollectionView()
                            }
                            Button("Add new collection"){
                                
                            }
                            
                        }
                        
                    }
                    
                    VStack{
                        
                        Text("Meal Types")
                            .frame(maxWidth: size.width, alignment: .leading)
                            .padding(30)
                        
                        HStack {
                            NavigationLink {
                                RecipeSearchView(searchQuery: $searchQuery, size: size, filterToggle: false, selectedMealType: RecipeSearchView.FilterMealType.breakfast, selectedCuisine: RecipeSearchView.FilterCuisineType.none)
                            } label: {
                                ItemCardView(urlString: "https://www.marionskitchen.com/wp-content/uploads/2021/08/20201116_Marions-Best-Pancakes-16-819x1024.jpeg", typeName: "Breakfast", size:size)
                            }
                            NavigationLink{
                                RecipeSearchView(searchQuery: $searchQuery, size: size, filterToggle: false, selectedMealType: RecipeSearchView.FilterMealType.lunch, selectedCuisine: RecipeSearchView.FilterCuisineType.none)
                            }label: {
                                ItemCardView(urlString: "https://insanelygoodrecipes.com/wp-content/uploads/2021/03/Homemade-Grilled-Cheese-Sandwich-with-Tomatoes.png", typeName: "Lunch", size:size)
                                
                            }
                            
                            NavigationLink{
                                RecipeSearchView(searchQuery: $searchQuery, size: size, filterToggle: false, selectedMealType: RecipeSearchView.FilterMealType.dinner, selectedCuisine: RecipeSearchView.FilterCuisineType.none)
                            }label: {
                                ItemCardView(urlString: "https://www.realsimple.com/thmb/fMh6cWLYxsddO3BuSJXanCk1gpI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/easy-dinner-recipes-f768402675e04452b1531360736da8b5.jpg", typeName: "Dinner", size:size)
                            }
                            
                            
                        }
                        
                    }
                } else {
                    RecipeSearchView(searchQuery: $searchQuery, size: size, filterToggle: true, selectedMealType: RecipeSearchView.FilterMealType.none, selectedCuisine: RecipeSearchView.FilterCuisineType.none)
                }
                
                
            }.searchable(text: $searchQuery)
               
                
               
            
        }
       
    }
        
}
                        

#Preview {
    GeometryReader{ geometry in
        RecipeHomeView(size:geometry.size)
    }
}
