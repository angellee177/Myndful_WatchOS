//
//  Mindful_WatchAppApp.swift
//  Mindful_WatchApp WatchKit Extension
//
//  Created by Angel Ria Purnamasari on 12/07/22.
//

import SwiftUI

@main
struct Mindful_WatchAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
