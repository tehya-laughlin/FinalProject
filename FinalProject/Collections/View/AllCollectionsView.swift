//
//  CollectionView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/25/23.
//

import SwiftUI
import SwiftData

struct AllCollectionsView: View {
    
    @State var isNewCollectionSelected = false
        
        var body: some View {
         
            CollectionListView()
                .navigationTitle("Collections")
                .toolbar {
                    Button {
                        isNewCollectionSelected.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
                .navigationDestination(isPresented: $isNewCollectionSelected) {
                    CollectionCardView(collections: CollectionItem())
                }
        }
    
}

