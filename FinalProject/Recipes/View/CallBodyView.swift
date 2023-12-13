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
                    Button("Load Recipes"){
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
                .errorAlert(error: $appViewModel.error)
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
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            .frame(height:size.height*0.72)
        }
    }
}

struct LocalizedAlertError: LocalizedError {
    let underlyingError: LocalizedError
    var errorDescription: String? {
        underlyingError.errorDescription
    }
    var recoverySuggestion: String? {
        underlyingError.recoverySuggestion
    }
    
    init?(error: Error?) {
        guard let localizedError = error as? LocalizedError else { return nil }
        underlyingError = localizedError
    }
}

extension View {
    func errorAlert(error: Binding<Error?>, buttonTitle: String = "OK") -> some View {
        let localizedAlertError = LocalizedAlertError(error: error.wrappedValue)
        return alert(isPresented: .constant(localizedAlertError != nil), error: localizedAlertError) { _ in
            Button(buttonTitle) {
                error.wrappedValue = nil
            }
        } message: { error in
            Text(error.recoverySuggestion ?? "")
        }
    }
}

