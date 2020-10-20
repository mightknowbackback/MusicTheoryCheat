//
//  MusicEnums.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import Foundation

// Named notes and associated functionality
enum PitchClass : Int {
    // All 12 notes
    case c = 0, dFlat = 1, d = 2, eFlat = 3, e = 4, f = 5, gFlat = 6, g = 7, aFlat = 8, a = 9, bFlat = 10, b = 11
    // All cases indexed by half-step compatible with MIDI note numbers
    static let all : [PitchClass] = [.c, .dFlat, .d, .eFlat, .e, .f, .gFlat, .g, .aFlat, .a, .bFlat, .b]
    // Get PitchClass by MIDI note number
    static func pitchClassBy(noteNumber num: Int) -> PitchClass {
        var i = num
        switch num {
        case 0...11:
            break
        case 12...Int.max:
            while i > 11 {
                i -= 12
            }
        default:
            while i < 0 {
                i += 12
            }
        }
        return Self.all[i]
    }
    // Get PitchClass by relative intervals
    func pitchClassFor(_ halfSteps: Int, stepsInDirection direction: PitchDirection) -> PitchClass {
        let op : (Int, Int) -> Int = direction == .up ? (+) : (-)
        let newNum = op(self.rawValue, halfSteps)
        return PitchClass.pitchClassBy(noteNumber: newNum)
    }
    // String for note name, with enharmonic spelling options
    func stringLiteral(inKey key: Key? = nil, withKeySpelling spelling: KeySpelling = .flats) -> String {
        var noteName : String = ""
        let accidental : String = spelling == .flats ? flatSymbol : sharpSymbol
        //let k : PitchClass = key == nil ? self : key!
        var result : String = ""
        switch self {
        case .c:
            noteName = "C"
        case .dFlat:
            noteName = spelling == .flats ? "D" : "C"
        case .d:
            noteName = "D"
        case .eFlat:
            noteName = spelling == .flats ? "E" : "D"
        case .e:
            noteName = "E"
        case .f:
            noteName = "F"
            let k = Key(keyCenter: .gFlat, tonality: .major)
            if k ~= key && spelling == .sharps {
                noteName = "E" + sharpSymbol
            }
        case .gFlat:
            noteName = spelling == .flats ? "G" : "F"
        case .g:
            noteName = "G"
        case .aFlat:
            noteName = spelling == .flats ? "A" : "G"
        case .a:
            noteName = "A"
        case .bFlat:
            noteName = spelling == .flats ? "B" : "A"
        case.b:
            noteName = "B"
            let k = Key(keyCenter: .gFlat, tonality: .major)
            if k ~= key && spelling == .flats {
                noteName = "C" + flatSymbol
            }
        }
        switch self {
        case .c, .d, .e, .f, .g, .a, .b:
            result = noteName
        default:
            result = noteName + accidental
        }
        return result
    }
    
}
// Major/minor tonality functionality
enum Tonality : String {
    case major = "Major", minor = "minor"
    var scale : [Int] {
        return self == .major ? majorScaleIntervals : minorScaleIntervals
    }
    static var all : [Tonality] = [.major, .minor]
}
// For intervals math
enum PitchDirection {
    case up, down
}
// For enharmonic spelling preference of individual notes, and for keeping spelling uniform within a key
enum KeySpelling : String {
    case flats, sharps
    static var all : [KeySpelling] = [.flats, .sharps]
}
