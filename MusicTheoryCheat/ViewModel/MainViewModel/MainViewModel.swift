//
//  MainViewModel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import Foundation
import SwiftUI

extension ViewModel {
    
    var primaryKeyLabelString : String {self.model.currentKey.name}
    var primaryNearKeyFlatLabelString : String {self.model.currentKey.nearKeyFlat.noteStringCased}
    var primaryNearKeySharpLabelString : String {self.model.currentKey.nearKeySharp.noteStringCased}
    var relativeKeyLabelString : String {self.model.currentKey.relativeKey.name}
    var relativeNearKeyFlatLabelString : String {self.model.currentKey.relativeKey.nearKeyFlat.noteStringCased}
    var relativeNearKeySharpLabelString : String {self.model.currentKey.relativeKey.nearKeySharp.noteStringCased}
    
    func chordNoteStrings(forScaleDegree i: Int) -> [String] {
        let pitches : [PitchClass] = self.model.currentKey.chordForScaleDegree(i)
        let spelling = self.model.currentKey.spelling
        return pitches.map {$0.stringLiteral(withKeySpelling: spelling)}
    }
    private var majorScaleDegreeStrings : [String] {
        let b = self.model.featuredTonality == .major
        switch self.model.symbolType {
        case .nashvilleNumbers:
            return b ? majorNashvilleNumbers : minorNashvilleNumbers
        case .romanNumerals:
            return b ? majorRomanNumerals : majorRomanNumeralsOffset
        }
    }
    private var minorScaleDegreeStrings : [String] {
        let b = self.model.featuredTonality == .minor
        switch self.model.symbolType {
        case .nashvilleNumbers:
            return !b ? majorNashvilleNumbers : minorNashvilleNumbers
        case .romanNumerals:
            return b ? minorRomanNumerals : minorRomanNumeralsOffset
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
