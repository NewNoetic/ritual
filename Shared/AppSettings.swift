//
//  Settings.swift
//  ritual
//
//  Created by Sidhant Gandhi on 3/28/20.
//  Copyright © 2020 newnoetic. All rights reserved.
//

import Foundation
import Combine

final class AppSettings: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @propertyWrapper
    struct UserDefault<T> {
        let key: String
        let defaultValue: T
        
        init(_ key: String, defaultValue: T) {
            self.key = key
            self.defaultValue = defaultValue
        }
        
        var wrappedValue: T {
            get {
                return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
            }
            set {
                UserDefaults.standard.set(newValue, forKey: key)
            }
        }
    }
        
    @UserDefault("settings.version", defaultValue: 0) var version: Int { willSet { objectWillChange.send() } }

}
