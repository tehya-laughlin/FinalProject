//
//  CustomButton.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/2/23.
//

import Foundation
import SwiftUI

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
            .background(Color.white)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .inset(by: 1)
                    .stroke(Color("Main"), lineWidth: 2)
            )
    }
}
