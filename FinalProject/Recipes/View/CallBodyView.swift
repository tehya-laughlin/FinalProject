//
//  ApiTextCall.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/23/23.
//

import SwiftUI

struct ApiTextCall: View {
    
    @ObservedObject var appViewModel: AppViewModel
    
    
    var body: some View {
        
        List(appViewModel.call.hits) { recipeInfo in
            
            Text("\(recipeInfo.recipe.label)")
            
        }
        
    }
    
}

#Preview {
    ApiTextCall(appViewModel: AppViewModel())
}
