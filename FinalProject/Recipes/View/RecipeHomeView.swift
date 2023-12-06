//
//  RecipeHomeView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI
import SwiftData

struct RecipeHomeView: View {
    
    @State var searchQuery: String = ""
    var size: CGSize
    @State var addCollectionAlert: Bool = false
    @ObservedObject var appViewModel = AppViewModel()
    
    @Environment(\.modelContext)  var modelContext
    
    var body: some View {
        NavigationStack{
            
            VStack{
                
                if(searchQuery.isEmpty){
                    VStack{
                        
                        Text("Meal Types")
                            .frame(maxWidth: size.width, alignment: .leading)
                            .padding(.leading, 30)
                            .font(.headline)
                        
                        HStack {
                            NavigationLink {
                                RecipeListView(size: size, selectedMealType: FilterMealType.breakfast, selectedCuisine: FilterCuisineType.none, selectedDish: FilterDishType.none )
                            } label: {
                                ItemCardView(urlString: "https://www.marionskitchen.com/wp-content/uploads/2021/08/20201116_Marions-Best-Pancakes-16-819x1024.jpeg", typeName: "Breakfast", size:size)
                            }
                            NavigationLink{
                                RecipeListView(size: size, selectedMealType: FilterMealType.lunch, selectedCuisine: FilterCuisineType.none, selectedDish: FilterDishType.none)
                            }label: {
                                ItemCardView(urlString: "https://insanelygoodrecipes.com/wp-content/uploads/2021/03/Homemade-Grilled-Cheese-Sandwich-with-Tomatoes.png", typeName: "Lunch", size:size)
                                
                            }
                            
                            NavigationLink{
                                RecipeListView(size: size, selectedMealType: FilterMealType.dinner, selectedCuisine: FilterCuisineType.none, selectedDish: FilterDishType.mainCourse)
                            }label: {
                                ItemCardView(urlString: "https://www.realsimple.com/thmb/fMh6cWLYxsddO3BuSJXanCk1gpI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/easy-dinner-recipes-f768402675e04452b1531360736da8b5.jpg", typeName: "Dinner", size:size)
                            }
                            
                            
                        }.frame(width: size.width, alignment: .leading)
                            .padding(.leading, 30)
                            .padding(.bottom, 24)
                        
                        
                        
                    }
                } else {
                    RecipeSearchView(searchQuery: $searchQuery, size: size, filterToggle: true, selectedMealType: FilterMealType.none, selectedCuisine: FilterCuisineType.none, selectedDish: FilterDishType.none)
                }
                
                Spacer()
            }.searchable(text: $searchQuery)
        }
       
    }
        
}
                        

#Preview {
    GeometryReader{ geometry in
        RecipeHomeView(size:geometry.size)
    }
}
