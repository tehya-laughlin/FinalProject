//
//  MealPlanningView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI

struct MealPlanningView: View {
    @State var pageToggle: Bool = true
    var body: some View {
        NavigationView{
            
            VStack{
                if(pageToggle){
                    WeekPlanView()
                } else {
                    DayPlanView()
                }
            }
            .toolbar {
                Button("week meal plan"){
                    pageToggle = true
                }
                
                Button("day meal plan"){
                    pageToggle = false
                }
            }
            
            
        }
    }
}

#Preview {
    MealPlanningView()
}
