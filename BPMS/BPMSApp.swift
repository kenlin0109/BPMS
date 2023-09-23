//
//  BPMSApp.swift
//  BPMS
//
//  Created by 林秀謙 on 2023/9/23.
//

import SwiftUI

@main
struct BPMSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
