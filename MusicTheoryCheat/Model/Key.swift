//
//  Key.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import Foundation

struct Key : Equatable {
    
    // MARK: Variable Properties
    var keyCenter : PitchClass
    var tonality : Tonality
    var preferSharpSpelling : Bool = false
    
    // MARK: Equatable
    static func == (lhs: Key, rhs: Key) -> Bool {
        return rhs.keyCenter == lhs.keyCenter && rhs.tonality == lhs.tonality
    }
    static func ~= (lhs: Key, rhs: Key) -> Bool {
        return lhs == rhs || lhs == rhs.relativeKey
    }
    
    // MARK: Naming
    var noteString : String {
        var str = ""
        func spellWithSharps() {
            str = self.keyCenter.stringLiteral(withKeySpelling: .sharps)
        }
        func spellWithFlats() {
            str = self.keyCenter.stringLiteral()
        }
        if self.tonality == .major {
            switch self.keyCenter {
            case .gFlat:
                if self.preferSharpSpelling {
                    spellWithSharps()
                } else {
                    fallthrough
                }
            default:
                spellWithFlats()
            }
        } else {
            switch self.keyCenter {
            case .aFlat, .dFlat, .gFlat:
                spellWithSharps()
            case .eFlat:
                if self.preferSharpSpelling {
                    spellWithSharps()
                } else {
                    fallthrough
                }
            default:
                spellWithFlats()
            }
        }
        return str
    }
    var noteStringCased : String {
        self.tonality == .major ? self.noteString : self.noteString.lowercased()
    }
    private var tonalityString : String {self.tonality.rawValue}
    var name : String {
        return self.noteStringCased + " " + self.tonalityString
        
    }
    var spelling : KeySpelling {
        if self.tonality == .major {
            switch self.keyCenter {
            case .g, .d, .a, .e, .b:
                return .sharps
            case .gFlat:
                if self.preferSharpSpelling {
                    return .sharps
                } else {
                    fallthrough
                }
            default:
                return .flats
            }
        } else {
            switch self.keyCenter {
            case .e, .b, .gFlat, .dFlat, .aFlat:
                return .sharps
            case .eFlat:
                if self.preferSharpSpelling {
                    return .sharps
                } else {
                    fallthrough
                }
            default:
                return .flats
            }
        }
    }
    
    // MARK: Key Information
    // Accidentals
    private let flatsOrder : [String] = ["B", "E", "A", "D", "G", "C", "F"]
    private let sharpsOrder : [String] = ["F", "C", "G", "D", "A", "E", "B"]
    var accidentals : [String] {
        var result : [String] = []
        var lastIndex = -1
        var testKey = Key(keyCenter: .c, tonality: .major)
        let amt : Int = self.spelling == .flats ? 5 : 7
        let all : [String] = self.spelling == .flats ? self.flatsOrder : self.sharpsOrder
        while !(testKey ~= self) {
            lastIndex += 1
            testKey = Key(keyCenter: testKey.keyCenter.pitchClassFor(amt, stepsInDirection: .up), tonality: .major)
        }
        if lastIndex != -1 {
            for i in 0...lastIndex {
                result.append(all[i])
            }
        }
        return result
    }
    // Diatonic scale from root
    var scale : [PitchClass] {
        var array : [PitchClass] = []
        for i in self.tonality.scale {
            array.append(self.keyCenter.pitchClassFor(i, stepsInDirection: .up))
        }
        return array
    }
    func chordForScaleDegree(_ i: Int) -> [PitchClass] {
        let root = self.scale[i]
        let third = i - 5 < 0 ? self.scale[i + 2] : self.scale[i - 5]
        let fifth = i - 3 < 0 ? self.scale[i + 4] : self.scale[i - 3]
        let seventh = i - 1 < 0 ? self.scale[i + 6] : self.scale[i - 1]
        return [root, third, fifth, seventh]
    }
    // Relative Major or minor (key with same accidentals)
    var relativeKey : Key {
        let tonality : Tonality = self.tonality == .major ? .minor : .major
        let direction : PitchDirection = self.tonality == .major ? .down : .up
        let keyCenter = self.keyCenter.pitchClassFor(3, stepsInDirection: direction)
        var key = Key(keyCenter: keyCenter, tonality: tonality)
        key.preferSharpSpelling = self.preferSharpSpelling
        return key
    }
    // Related key with one more sharp (ex. G for key of C)
    var nearKeySharp : Key {
        let keyCenter = self.keyCenter.pitchClassFor(5, stepsInDirection: .down)
        var key = Key(keyCenter: keyCenter, tonality: self.tonality)
        key.preferSharpSpelling = self.preferSharpSpelling
        return key
    }
    // Related key with one more flat (ex. F for key of C)
    var nearKeyFlat : Key {
        let keyCenter = self.keyCenter.pitchClassFor(5, stepsInDirection: .up)
        let key = Key(keyCenter: keyCenter, tonality: self.tonality)
        return key
    }
    
    // MARK: Playable Functionality
    private let lowestNote : UInt8 = 53
    var playableScale : [UInt8] {
        var result : [UInt8] = []
        
        let scale = self.scale.map {UInt8($0.rawValue) + 48}
        print("")
        print(scale)
        for note in scale {
            if let previousNote = scale.last {
                if note < previousNote {
                    result.append(note + 12)
                } else {
                    result.append(note)
                }
            } else {
                result.append(note)
            }
        }
        if result[0] < self.lowestNote {
            result = result.map {$0 + 12}
        }
        print(result)
        return result
    }
    func playableChordFor(scaleDegree: Int) -> [UInt8] {
        let full = self.playableScale + self.playableScale.map {$0 + 12}
        let root = full[scaleDegree]
        return [root]
    }
    func playableNoteForChordTone(_ chordTone: Int, withRoot root: Int) -> UInt8 {
        let full = self.playableScale + self.playableScale.map {$0 + 12}
        var result = full[chordTone + root]
        if full[root] >= self.lowestNote + 12 {
            result -= 12
        }
        return result
    }
}
