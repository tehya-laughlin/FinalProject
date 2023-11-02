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
    var filterToggle: Bool
    
    
    enum FilterMealType: String, CaseIterable, Identifiable {
        case breakfast = "Breakfast"
        case dinner = "Dinner"
        case lunch = "Lunch"
        case teatime = "Teatime"
        case snack = "Snack"
        case none = ""
        var id: Self { self }
    }
    
    enum FilterCuisineType: String, CaseIterable, Identifiable {
        case american = "American"
        case asian = "Asian"
        case british = "British"
        case caribbean = "Caribbean"
        case centralEurope = "CentralEurope"
        case chinese = "Chinese"
        case easternEurope = "EasternEurope"
        case french = "French"
        case indian = "Indian"
        case italian = "Italian"
        case japanese = "Japanese"
        case kosher = "Kosher"
        case mediterranean = "Mediterranean"
        case mexican = "Mexican"
        case middleEastern = "MiddleEastern"
        case nordic = "Nordic"
        case southAmerican = "SouthAmerican"
        case southEastAsian = "SouthEastAsian"
        case none = ""
        var id: Self { self }
    }

    @State  var selectedMealType: FilterMealType
    
    @State  var selectedCuisine: FilterCuisineType
    
    var body: some View {
        VStack{
            
            if(filterToggle){
                    HStack{
                        Picker("Meal Type", selection: $selectedMealType) {
                            Text("MealType").tag(FilterMealType.none)
                            Text("Breakfast").tag(FilterMealType.breakfast)
                            Text("Lunch").tag(FilterMealType.lunch)
                            Text("Dinner").tag(FilterMealType.dinner)
                            Text("Snack").tag(FilterMealType.snack)
                            Text("Teatime").tag(FilterMealType.teatime)
                                
                        }
                        
                        Picker("Cuisine Type", selection: $selectedCuisine) {
                            Text("Cuisine Type").tag(FilterCuisineType.none)
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
            }
            
            Button("Load Recipes") {
                Task{
                    await appViewModel.getCall(searchValue: searchQuery, mealType: selectedMealType.rawValue, cuisineType: selectedCuisine.rawValue)
                }
            }
            .frame(width: size.width, alignment: .leading)
            .padding(.leading, 30)
            
            CallBodyView(appViewModel: appViewModel, size: size)
            
           
            
        }
       
    }
}

