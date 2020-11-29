//
//  ritualApp.swift
//  ritual WatchKit Extension
//
//  Created by Sidhant Gandhi on 11/29/20.
//

import SwiftUI

@main
struct ritualApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
