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
    var relativeNearKeySharpLabelString : String {self.model.currentKey.relativeKey.noteStringCased}
    
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
