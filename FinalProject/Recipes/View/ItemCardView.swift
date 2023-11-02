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
            AsyncImage(url: URL(string: urlString))
                .scaleEffect(CGSize(width: 0.2, height: 0.2))
                .frame(width: size.width/4, height: size.width/4)
                        .cornerRadius(5)
                    Text(typeName)
                        .font(.caption)
        }
        .padding(.leading, 10)
    }
}

