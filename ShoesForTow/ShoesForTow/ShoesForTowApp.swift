//
//  ShoesForTowApp.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 17/09/24.
//

import SwiftUI

@main
struct ShoesForTowApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
