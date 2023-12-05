//
//  RecipeSearchView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI

    enum FilterMealType: String, CaseIterable, Identifiable {
        case breakfast = "Breakfast"
        case dinner = "Dinner"
        case lunch = "Lunch"
        case teatime = "Teatime"
        case snack = "Snack"
        case none = ""
        var id: Self { self }
    }
    
    enum FilterDishType: String, CaseIterable, Identifiable {
        case bread = "Bread"
        case cereal = "Cereals"
        case sweets = "Sweets"
        case starter = "Starter"
        case soup = "Soup"
        case sandwiches = "Sandwiches"
        case salad = "Salad"
        case preserve = "Preserve"
        case preps = "Preps"
        case pancake = "Pancake"
        case drinks = "Drinks"
        case desserts = "Desserts"
        case mainCourse = "Main%20course"
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


struct RecipeSearchView: View {
    
    @Binding var searchQuery: String
    @ObservedObject var appViewModel = AppViewModel()
    var size: CGSize
    var filterToggle: Bool

    @State  var selectedMealType: FilterMealType
    
    @State  var selectedCuisine: FilterCuisineType
    
    @State  var selectedDish: FilterDishType
    
    var body: some View {
        NavigationView{
            VStack{
    
                
                CallBodyView(appViewModel: appViewModel, size: size, searchQuery: searchQuery, selectedMealType: $selectedMealType, selectedCuisine: $selectedCuisine, selectedDish: $selectedDish)
                    .offset(CGSize(width: 0.0, height: -75.0))
                    .frame(height: size.height*5/7)
                
                
                
            }.toolbar{
                
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

                Picker("Dish Type", selection: $selectedDish) {
                    Text("Dish Type").tag(FilterDishType.none)
                    Text("Bread").tag(FilterDishType.bread)
                    Text("Cereal").tag(FilterDishType.cereal)
                    Text("Pancakes").tag(FilterDishType.pancake)
                    Text("Drinks").tag(FilterDishType.drinks)
                    Text("Desserts").tag(FilterDishType.desserts)
                    Text("Sweets").tag(FilterDishType.sweets)
                    Text("Salad").tag(FilterDishType.salad)
                    Text("Starter").tag(FilterDishType.starter)
                    Text("Preps").tag(FilterDishType.preps)
                    Text("Preserves").tag(FilterDishType.preserve)
                    Text("Soup").tag(FilterDishType.soup)
                    Text("Sandwiches").tag(FilterDishType.sandwiches)
                }
                
                
            }
        }
       
    }
}

