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
    
    
    var body: some View {
        
        Button("Next Page") {
            Task {
                await appViewModel.getCallFromUrl(url: appViewModel.call._links.next.href)
            }
        }
        
        ScrollView{
            ForEach(appViewModel.call.hits) { recipeInfo in
                NavigationLink(destination: RecipeDetailView(size:size)){
                    RecipeCardView(recipe: recipeInfo.recipe, size: size)
                }
                    
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        
        
    }
    
}

#Preview {
    GeometryReader{ geometry in
        CallBodyView(appViewModel: AppViewModel(), size: geometry.size)
    }
}
