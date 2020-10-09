//
//  MainViewModel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import Foundation
import SwiftUI

extension ViewModel {
    
    var primaryKeyName : String {self.model.currentKey.noteString}
    var primaryNearKeyFlatName : String {self.model.currentKey.nearKeyFlat.noteString}
    var primaryNearKeySharpName : String {self.model.currentKey.nearKeySharp.noteString}
    var relativeKeyNameName : String {self.model.currentKey.relativeKey.noteString}
    var relativeNearKeyFlatName : String {self.model.currentKey.relativeKey.nearKeyFlat.noteString}
    var relativeNearKeySharpName : String {self.model.currentKey.relativeKey.nearKeySharp.noteString}
    
    func chordNoteStrings(forScaleDegree i: Int) -> [String] {
        let pitches : [PitchClass] = self.model.currentKey.chordForScaleDegree(i)
        let spelling = self.model.currentKey.spelling
        return pitches.map {$0.stringLiteral(withKeySpelling: spelling)}
    }
    private var majorScaleDegreeStrings : [String] {
        switch self.model.symbolType {
        case .nashvilleNumbers:
            return majorNashvilleNumbers
        case .romanNumerals:
            return majorRomanNumerals
        }
    }
    private var minorScaleDegreeStrings : [String] {
        switch self.model.symbolType {
        case .nashvilleNumbers:
            return minorNashvilleNumbers
        case .romanNumerals:
            return minorRomanNumerals
        }
    }
    var featuredKeyScaleDegreeStrings : [String] {
        let isMajor = model.featuredTonality == .major
        return isMajor ? self.majorScaleDegreeStrings : self.minorScaleDegreeStrings
    }
    var relativeKeyScaleDegreeStrings : [String] {
        let isMinor = model.featuredTonality == .minor
        return isMinor ? self.majorScaleDegreeStrings : self.minorScaleDegreeStrings
    }
    
}
