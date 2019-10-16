//
//  MappingSetterTests.swift
//  
//
//  Created by Roman Podymov on 16/10/2019.
//

import XCTest
@testable import MappingSetter

final class MappingSetterTests: XCTestCase {

    @MappingSetter(mappingSetter: { $0.trimmingCharacters(in: .whitespacesAndNewlines) })
    var trimmed: String = "   Hello, World! \n   \n"

    @MappingSetter(mappingSetter: { String($0.prefix(5)) })
    var upToFive: String = "Hello, World!"

    @MappingSetter(mappingSetter: { $0 })
    var unmodified: String = "Hello, "

    func testTrimmed() {
        trimmed += "\n \n"
        XCTAssertEqual(trimmed, "Hello, World!")
    }

    func testUpToFive() {
        upToFive += "\n \n"
        XCTAssertEqual(upToFive, "Hello")
    }

    func testUnmodified() {
        unmodified += "World!"
        XCTAssertEqual(unmodified, "Hello, World!")
    }

    static var allTests = [
        ("testTrimmed", testTrimmed),
        ("testUpToFive", testUpToFive),
        ("testUnmodified", testUnmodified),
    ]
}
