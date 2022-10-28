//
//  WaspCat499CsumbApp.swift
//  WaspCat499Csumb WatchKit Extension
//
//  Created by user228393 on 10/14/22.
//

import SwiftUI

@main
struct WaspCat499CsumbApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
