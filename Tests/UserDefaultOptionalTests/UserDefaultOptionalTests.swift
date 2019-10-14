//
//  UserDefaultOptionalTests.swift
//  
//
//  Created by Roman Podymov on 14/10/2019.
//

import XCTest
@testable import UserDefaultOptional

final class UserDefaultOptionalTests: XCTestCase {
    
    // Note: Property delegates are not yet supported on local properties, hence using stored properties.
    
    @UserDefaultOptional("test")
    var test: String?
    
    @UserDefault("count")
    var count: Int
    
    func testGetValueOrNil() {
        let userDefaults = UserDefaults.makeClearedInstance()
        _test.userDefaults = userDefaults
        XCAssertNil(test)
        XCTAssertEqual(userDefaults.string(forKey: "test"), nil)
    }
    
    func testGet() {
        let userDefaults = UserDefaults.makeClearedInstance()
        userDefaults.set("Existing value for test key :D", forKey: "test")
        _test.userDefaults = userDefaults
        
        XCTAssertEqual(test, "Existing value for test key :D")
        XCTAssertEqual(userDefaults.string(forKey: "test"), "Existing value for test key :D")
    }
    
    func testSet() {
        let userDefaults = UserDefaults.makeClearedInstance()
        _test.userDefaults = userDefaults
        test = "A new value for test key :P"
        
        XCTAssertEqual(userDefaults.string(forKey: "test"), "A new value for test key :P")
        XCTAssertEqual(test, "A new value for test key :P")
    }
    
    func testInt() {
        _count.userDefaults = UserDefaults.makeClearedInstance()
        
        XCTAssertEqual(count, 13)
        count = 7
        XCTAssertEqual(count, 7)
    }
    
    static var allTests = [
        ("testGetValueOrNil", testGetValueOrNil),
        ("testGet", testGet),
        ("testSet", testSet),
        ("testInt", testInt),
    ]
}

fileprivate extension UserDefaults {
    static func makeClearedInstance(
        for functionName: StaticString = #function,
        inFile fileName: StaticString = #file
    ) -> UserDefaults {
        let className = "\(fileName)".split(separator: ".")[0]
        let testName = "\(functionName)".split(separator: "(")[0]
        let suiteName = "\(className).\(testName)"
        
        let defaults = self.init(suiteName: suiteName)!
        defaults.removePersistentDomain(forName: suiteName)
        return defaults
    }
}
