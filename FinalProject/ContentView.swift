//
//  ContentView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var appViewModel = AppViewModel()

    var body: some View {
      
        VStack{
            Button("Load Recipes") {
                Task{
                    await appViewModel.getCall()
                }
            }
            Text("\(appViewModel.call.hits.count)")
                ApiTextCall(appViewModel: appViewModel)
        }
       
            
    }
        
}

#Preview {
    ContentView()
}
