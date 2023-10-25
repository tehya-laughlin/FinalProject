//
//  PantryView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI

struct PantryView: View {
    @State var pageToggle: Bool = true
    var body: some View {
        NavigationView{
            
            VStack{
                if(pageToggle){
                    InPantryView()
                } else {
                    AddPantryView()
                }
            }
            .toolbar {
                Button("Current pantry"){
                    pageToggle = true
                }
                
                Button("Add to pantry"){
                    pageToggle = false
                }
            }
            
            
        }
        
        
    }
}

#Preview {
    PantryView()
}
