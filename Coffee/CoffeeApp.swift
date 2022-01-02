//
//  CoffeeApp.swift
//  Coffee
//
//  Created by Aleksandr Motarykin on 2.01.22.
//

import SwiftUI

@main
struct CoffeeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
