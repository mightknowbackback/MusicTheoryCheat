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
        let third = i + 2 > 6 ? self.scale[i - 4] : self.scale[i + 2]
        let fifth = i + 4 > 6 ? self.scale[i - 2] : self.scale[i + 4]
        let seventh = i - 1 < 0 ? self.scale[i + 6] : self.scale[i - 1]
        return [root, third, fifth, seventh]
    }
    // Relative Major or minor (key with same accidentals)
    var relativeKey : Key {
        let tonality : Tonality = self.tonality == .major ? .minor : .major
        let direction : PitchDirection = self.tonality == .major ? .down : .up
        let keyCenter = self.keyCenter.pitchClassFor(3, stepsInDirection: direction)
        return Key(keyCenter: keyCenter, tonality: tonality)
    }
    // Related key with one more sharp (ex. G for key of C)
    var nearKeySharp : Key {
        let keyCenter = self.keyCenter.pitchClassFor(5, stepsInDirection: .down)
        return Key(keyCenter: keyCenter, tonality: self.tonality)
    }
    // Related key with one more flat (ex. F for key of C)
    var nearKeyFlat : Key {
        let keyCenter = self.keyCenter.pitchClassFor(5, stepsInDirection: .up)
        return Key(keyCenter: keyCenter, tonality: self.tonality)
    }
    
}
