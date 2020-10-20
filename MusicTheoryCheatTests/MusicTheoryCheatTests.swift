//
//  MusicTheoryCheatTests.swift
//  MusicTheoryCheatTests
//
//  Created by mightknow on 9/29/20.
//

import XCTest
@testable import MusicTheoryCheat

class MusicTheoryCheatTests: XCTestCase {
    
    func testPitchClassStringLiterals() {
        
        let eSharpString = "E" + sharpSymbol
        let f : PitchClass = .f
        let key = Key(keyCenter: .gFlat, tonality: .major)
        XCTAssertEqual(f.stringLiteral(inKey: key, withKeySpelling: .sharps), eSharpString)
        
        let fString = "F"
        XCTAssertEqual(f.stringLiteral(inKey: key, withKeySpelling: .flats), fString)
        
        let cFlatString = "C" + flatSymbol
        let b : PitchClass = .b
        XCTAssertEqual(b.stringLiteral(inKey: key), cFlatString)
        
        let bString = "B"
        XCTAssertEqual(b.stringLiteral(inKey: key, withKeySpelling: .sharps), bString)
        
        let fSharpString = "F" + sharpSymbol
        let fSharp : PitchClass = .gFlat
        XCTAssertEqual(fSharp.stringLiteral(withKeySpelling: .sharps), fSharpString)
        
        let gFlatString = "G" + flatSymbol
        XCTAssertEqual(fSharp.stringLiteral(withKeySpelling: .flats), gFlatString)
        
    }
    func testKeyAccidentalArray() {
        
        let gFlatMajor = Key(keyCenter: .gFlat, tonality: .major)
        let gFlatMajorAccidentals : [String] = ["B", "E", "A", "D", "G", "C"]
        XCTAssertEqual(gFlatMajor.accidentals, gFlatMajorAccidentals)
        
        let fSharpMajor = Key(keyCenter: .gFlat, tonality: .major, preferSharpSpelling: true)
        let fSharpMajorAccidentals : [String] = ["F", "C", "G", "D", "A", "E"]
        XCTAssertEqual(fSharpMajor.accidentals, fSharpMajorAccidentals)
        
        let gMinor = Key(keyCenter: .g, tonality: .minor)
        let gMinorAccidentals : [String] = ["B", "E"]
        XCTAssertEqual(gMinor.accidentals, gMinorAccidentals)
        
    }
    
    func testKey() {
        
        let gFlatMajor : Key = Key(keyCenter: .gFlat, tonality: .major)
        let gFlatMajorScale : [PitchClass] = [.gFlat, .aFlat, .bFlat, .b, .dFlat, .eFlat, .f]
        let testScale : [PitchClass] = gFlatMajor.scale
        XCTAssertEqual(testScale, gFlatMajorScale)
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
