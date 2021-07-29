//
//  ritualApp.swift
//  Shared
//
//  Created by Sidhant Gandhi on 11/28/20.
//

import SwiftUI

@main
struct ritualApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch (AppState.shared.startView) {
                case .intro1:
                    IntroView()
                case .ritual1:
                    MainView()
                }
            }.environmentObject(AppState.shared)
        }
    }
}
