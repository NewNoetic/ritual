//
//  Migration.swift
//  ritual
//
//  Created by Sidhant Gandhi on 4/11/20.
//  Copyright © 2020 newnoetic. All rights reserved.
//

import Foundation
import UserNotifications
import SwiftUI

struct Migration {
    @ObservedObject static var settings = AppSettings()
    
    static func run() {
        if settings.version == 0 {
            defer {
                settings.version = 1
                AppState.shared.startView = .ritual1
            }
            print("running migration from 0 to 1")
            // nothing to actually migrate
        }
//        if settings.version == 1 {
//            print("running db migration from 1 to 2")
//            // handle second migration
//            settings.version = 2
//        }
    }
}
