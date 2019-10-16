//
//  IntValue.swift
//
//
//  Created by Roman Podymov on 16/10/2019.
//

@propertyWrapper
public struct IntValue {
    var value: String?
    
    public init() {
        value = nil
    }
    
    public var wrappedValue: Int? {
        get {
            guard let value = value else {
                return nil
            }
            return Int(value)
        }
        set {
            value = newValue
        }
    }
}
