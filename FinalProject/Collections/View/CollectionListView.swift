//
//  CollectionListView.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 11/5/23.
//

import SwiftUI
import SwiftData

struct CollectionListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var collections: [CollectionItem]
    @State var selectedCollection: CollectionItem?
    @State var didSelectCollection = false
    
    var body: some View {
        GeometryReader{ geometry in
            let size = geometry.size
            
            List {
                ForEach(collections) { collection in
                    Button {
                        selectedCollection = collection
                        didSelectCollection.toggle()
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(width:size.width * 0.8, height:120)
                                .foregroundColor(.white)
                            
                            HStack{
                                ZStack(alignment: .bottomLeading){
                                    AsyncImage(url: URL(string: collection.collection.isEmpty ? "https://roadmap-tech.com/wp-content/uploads/2019/04/placeholder-image.jpg" : collection.collection[0].imageLink))
                                        .frame(width: size.width*0.4, height: 120)
                                        .clipped()
                                    
                                    
                                    Image(systemName: "folder")
                                        .frame(alignment: .bottomLeading)
                                        .scaleEffect(CGSize(width: 1.7, height: 1.7))
                                        .foregroundColor(.white)
                                        .padding()
                                        .shadow(radius: 5)
                                    Text(collection.collection.isEmpty ? "0" : "\(collection.collection.count)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .frame(alignment: .bottomLeading)
                                        .foregroundColor(.white)
                                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 14, trailing: 10))
                                        .shadow(radius: 5)
                                }

                                VStack{
                                    Text("\(collection.name)")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    Text(collection.collection.isEmpty ? "No recipes added" : "\(collection.collection[0].label)")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }
                                .frame(width: size.width*0.4)
                                .padding(.leading, 20)
                                .padding(.trailing, 10)
                                
                            }
                        }
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                        
                    }
                }.onDelete(perform: deleteCollections)
                    .listRowSeparator(.hidden)
                    .navigationDestination(isPresented: $didSelectCollection) {
                        CollectionCardView(collections: selectedCollection ?? CollectionItem())
                    }
            }
            .listStyle(.plain)
        }
    }
    
    // MOVE ME TO A VIEW MODEL!!!!!
    func deleteCollections(_ indexSet: IndexSet) {
        for index in indexSet {
            let collection = collections[index]
            modelContext.delete(collection)
        }
    }
}


