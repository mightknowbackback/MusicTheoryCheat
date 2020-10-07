//
//  Key.swift
//  Theory Wheel
//
//  Created by mightknow on 10/6/20.
//

import Foundation

struct Key {
    
    var keyCenter : PitchClass
    var tonality : Tonality
    
    //TODO: Fix this!!!
    func name(withSpelling spelling: KeySpelling = .flats) -> String {
        let noteString = self.keyCenter.stringLiteral(withKeySpelling: spelling)
        let tonalityString = self.tonality.rawValue
        return noteString + tonalityString
    }
    
    var scale : [PitchClass] {
        var array : [PitchClass] = []
        for i in self.tonality.scale {
            array.append(self.keyCenter.pitchClassFor(i, stepsInDirection: .up))
        }
        return array
    }
    
    var relativeKey : Key {
        let tonality : Tonality = self.tonality == .major ? .major : .minor
        let direction : PitchDirection = self.tonality == .major ? .up : .down
        let keyCenter = self.keyCenter.pitchClassFor(3, stepsInDirection: direction)
        return Key(keyCenter: keyCenter, tonality: tonality)
    }
    var nearKeySharp : Key {
        let keyCenter = self.keyCenter.pitchClassFor(5, stepsInDirection: .down)
        return Key(keyCenter: keyCenter, tonality: self.tonality)
    }
    var nearKeyFlat : Key {
        let keyCenter = self.keyCenter.pitchClassFor(5, stepsInDirection: .up)
        return Key(keyCenter: keyCenter, tonality: self.tonality)
    }
    
    var spelling : KeySpelling {
        var result : KeySpelling = .flats
        switch self.keyCenter {
        case .g, .d, .a, .e, .b:
            result = .sharps
        default:
            break
        }
        return result
    }
    
}
