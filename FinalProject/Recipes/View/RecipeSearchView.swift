//
//  RecipeSearchView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI

struct RecipeSearchView: View {
    
    @Binding var searchQuery: String
    @ObservedObject var appViewModel = AppViewModel()
    var size: CGSize
    
    
    enum FilterMealType: String, CaseIterable, Identifiable {
        case breakfast, dinner, lunch, teatime, snack, none
        var id: Self { self }
    }
    
    enum FilterCuisineType: String, CaseIterable, Identifiable {
        case american, asian, british, caribbean, centralEurope, chinese, easternEurope, french, indian, italian, japanese, kosher, mediterranean, mexican, middleEastern, nordic, southAmerican, southEastAsian, none
        var id: Self { self }
    }

    @State private var selectedFlavor: FilterMealType = .none
    
    @State private var selectedCuisine: FilterCuisineType = .none
    
    var body: some View {
        VStack{
            
            HStack{
                
                Picker("Meal Type", selection: $selectedFlavor) {
                        Text("Breakfast").tag(FilterMealType.breakfast)
                        Text("Lunch").tag(FilterMealType.lunch)
                        Text("Dinner").tag(FilterMealType.dinner)
                        Text("Snack").tag(FilterMealType.snack)
                        Text("Teatime").tag(FilterMealType.teatime)
                    }
                
                Picker("Cuisine Type", selection: $selectedCuisine) {
                        Text("American").tag(FilterCuisineType.american)
                        Text("Asian").tag(FilterCuisineType.asian)
                        Text("British").tag(FilterCuisineType.british)
                        Text("Caribbean").tag(FilterCuisineType.caribbean)
                        Text("Central European").tag(FilterCuisineType.centralEurope)
                        Text("Chinese").tag(FilterCuisineType.chinese)
                        Text("Eastern European").tag(FilterCuisineType.easternEurope)
                        Text("French").tag(FilterCuisineType.french)
                        Text("Italian").tag(FilterCuisineType.italian)
                        Text("Indian").tag(FilterCuisineType.indian)
                        Text("Japanese").tag(FilterCuisineType.japanese)
                        Text("Kosher").tag(FilterCuisineType.kosher)
                        Text("Mediterranean").tag(FilterCuisineType.mediterranean)
                        Text("Mexican").tag(FilterCuisineType.mexican)
                        Text("Middle Eastern").tag(FilterCuisineType.middleEastern)
                        Text("Nordic").tag(FilterCuisineType.nordic)
                        Text("South American").tag(FilterCuisineType.southAmerican)
                        Text("South East Asian").tag(FilterCuisineType.southEastAsian)
                    }
                
            }
            
            Button("Load Recipes") {
                Task{
                    await appViewModel.getCall(searchValue: searchQuery)
                }
            }
            
            Text("\(appViewModel.call.hits.count)")
            CallBodyView(appViewModel: appViewModel, size: size)
            
           
            
        }
       
    }
}

