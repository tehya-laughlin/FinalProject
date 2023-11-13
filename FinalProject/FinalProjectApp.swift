//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by Tehya Laughlin on 10/23/23.
//

import SwiftUI
import SwiftData

@main
struct FinalProjectApp: App {

    var container: ModelContainer

        init() {
            do {
                let config1 = ModelConfiguration(for: Item.self)
                let config2 = ModelConfiguration(for: CollectionItem.self)

                container = try ModelContainer(for: Item.self, CollectionItem.self, configurations: config1, config2)
            } catch {
                fatalError("Failed to configure SwiftData container.")
            }
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
     
    }
}
