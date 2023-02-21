//
//  rizzcounterApp.swift
//  rizzcounter
//
//  Created by Bernice Arreola on 2/20/23.
//

import SwiftUI

@main
struct rizzcounterApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
