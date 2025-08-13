//
//  ConnectSphereApp.swift
//  ConnectSphere
//
//  Created by Михайло Тихонов on 11.08.2025.
//

import SwiftUI
import SwiftData

@main
struct ConnectSphereApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
