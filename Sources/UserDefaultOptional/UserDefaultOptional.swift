//
//  UserDefaultOptional.swift
//  
//
//  Created by Roman Podymov on 14/10/2019.
//

import Foundation

/// A type safe property wrapper to set and get values from UserDefaults. Returns nil if value for key is not found.
///
/// Usage:
/// ```
/// @UserDefaultOptional("has_seen_app_introduction")
/// static var hasSeenAppIntroduction: Bool?
/// ```
///
/// [Apple documentation on UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults)
@available(iOS 2.0, OSX 10.0, tvOS 9.0, watchOS 2.0, *)
@propertyWrapper
public struct UserDefaultOptional<Value: PropertyListValue> {
    let key: String
    var userDefaults: UserDefaults

    public init(_ key: String, userDefaults: UserDefaults = .standard) {
        self.key = key
        self.userDefaults = userDefaults
    }

    public var wrappedValue: Value? {
        get {
            return userDefaults.object(forKey: key) as? Value
        }
        set {
            userDefaults.set(newValue, forKey: key)
        }
    }
}
