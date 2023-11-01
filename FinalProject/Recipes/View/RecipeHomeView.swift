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
                    RecipeSearchView(searchQuery: $searchQuery, size: size)
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
