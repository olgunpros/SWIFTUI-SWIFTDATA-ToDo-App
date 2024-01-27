//
//  datatodoappApp.swift
//  datatodoapp
//
//  Created by Olgun ‏‏‎‏‏‎ on 27.01.2024.
//

import SwiftUI

@main
struct datatodoappApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListScreen()

            }
        }.modelContainer(for: [ToDo.self])
    }
}
