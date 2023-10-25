//
//  RecipeHomeView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI

struct RecipeHomeView: View {
    @State var searchQuery: String = ""
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
                            NavigationLink("This goes to collections") {
                                CollectionView()
                            }
                            Button("Add new collection"){
                                
                            }
                            
                        }
                        
                    }
                    
                    VStack{
                        
                        Text("Meal Types")
                        
                        HStack {
                            NavigationLink("breakfast") {
                                
                            }
                            NavigationLink("lunch") {
                                
                            }
                            NavigationLink("dinner"){
                                
                            }
                            
                        }
                        
                    }
                } else {
                    
                    //display list, load in recipes based on search query to recipe name, ingredients, cusine, meal type, etc.
                    
                    RecipeSearchView()
                    
                }
                
                
            }.searchable(text: $searchQuery)
            
        }
    }
}

#Preview {
    RecipeHomeView()
}
