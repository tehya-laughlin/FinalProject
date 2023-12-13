//
//  RecipeListView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/2/23.
//
//
//  RecipeSearchView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI

struct RecipeListView: View {
    
    var searchQuery: String = ""
    @ObservedObject var appViewModel = AppViewModel()
    var size: CGSize
    @State  var selectedMealType: FilterMealType
    @State  var selectedCuisine: FilterCuisineType
    @State  var selectedDish: FilterDishType
    
    var body: some View {
        VStack{
            CallBodyView(appViewModel: appViewModel, size: size, searchQuery: searchQuery, selectedMealType: $selectedMealType, selectedCuisine: $selectedCuisine, selectedDish: $selectedDish)
                .frame(height: size.height*0.9)
                .offset(CGSize(width: 0.0, height: -20.0))
        }
        .toolbar(.visible, for: .tabBar)
    }
}
