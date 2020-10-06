//
//  Theory_WheelTests.swift
//  Theory WheelTests
//
//  Created by mightknow on 9/29/20.
//

import XCTest
@testable import Theory_Wheel

class Theory_WheelTests: XCTestCase {
    
    func testPitchClassStringLiterals() {
        
        let eSharpString = "E" + sharpSymbol
        let f : PitchClass = .f
        XCTAssertEqual(f.stringLiteral(inKey: .gFlat, withKeySpelling: .sharps), eSharpString)
        
        let fString = "F"
        XCTAssertEqual(f.stringLiteral(inKey: .gFlat, withKeySpelling: .flats), fString)
        
        let cFlatString = "C" + flatSymbol
        let b : PitchClass = .b
        XCTAssertEqual(b.stringLiteral(inKey: .gFlat), cFlatString)
        
        let bString = "B"
        XCTAssertEqual(b.stringLiteral(inKey: .gFlat, withKeySpelling: .sharps), bString)
        
        let fSharpString = "F" + sharpSymbol
        let fSharp : PitchClass = .gFlat
        XCTAssertEqual(fSharp.stringLiteral(withKeySpelling: .sharps), fSharpString)
        
        let gFlatString = "G" + flatSymbol
        XCTAssertEqual(fSharp.stringLiteral(withKeySpelling: .flats), gFlatString)
        
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
