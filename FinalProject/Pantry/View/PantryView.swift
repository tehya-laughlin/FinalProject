//
//  PantryView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI
import SwiftData

struct PantryView: View {
    @Environment(\.modelContext) var modelContext
    @State var pageToggle: Bool = true
    @ObservedObject var pantryViewModel = PantryViewModel()
    @State var ingredients = [Item]()
    
    var size: CGSize
    
    var body: some View {
        NavigationView{
            
            VStack{
                if(pageToggle){
                    InPantryView(pantryViewModel: pantryViewModel, size: size)
                } else {
                    AddPantryView(pantryViewModel: pantryViewModel, size: size)
                }
            }
            .toolbar{
                Button{
                    pageToggle = true
                } label: {
                    if(pageToggle) {
                        Text("Current pantry")
                            .font(.title3)
                            .fontWeight(.bold)
                            
                    } else {
                        Text("Current pantry")
                            .font(.title3)
                            .fontWeight(.regular)
                            
                    }
                }
                .frame(alignment: .leading)
              
                
                Button{
                    pageToggle = false
                } label: {
                    if(pageToggle) {
                        Text("Add to pantry")
                            .font(.title3)
                            .fontWeight(.regular)
                           
                    } else {
                        Text("Add to pantry")
                            .font(.title3)
                            .fontWeight(.bold)
                          
                    }
                }
                
            }
            
            
        }
        
        
    }
}

