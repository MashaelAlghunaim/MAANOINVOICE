//
//  MAANOINVOICEApp.swift
//  MAANOINVOICE
//
//  Created by Mashael Alghunaim on 12/05/1444 AH.
//

import SwiftUI

@main
struct MAANOINVOICEApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
