//
//  ItemCardView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/1/23.
//

import SwiftUI

struct ItemCardView: View {
    
    var urlString: String
    var typeName: String
    var size: CGSize
    
    var body: some View {
        VStack(alignment: .leading) {
            if(urlString.isEmpty){
                ZStack{
                    Rectangle()
                        .frame(width: size.width/4, height: size.width/4)
                        .foregroundColor(Color("Background"))
                        
                    Image(systemName: "heart").scaleEffect(CGSize(width: 2.0, height: 2.0))
                }
                .cornerRadius(5)
                
            } else {
                AsyncImage(url: URL(string: urlString))
                    .scaleEffect(CGSize(width: 0.2, height: 0.2))
                    .frame(width: size.width/4, height: size.width/4)
                    .cornerRadius(5)
            }
            
            
                    Text(typeName)
                        .font(.caption)
        }
        .padding(.leading, 10)
    }
}

