//
//  MainViewModel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import Foundation
import SwiftUI

extension ViewModel {
    
    var primaryKeyLabelString : String {self.model.currentKey.noteString}
    var primaryNearKeyFlatLabelString : String {self.model.currentKey.nearKeyFlat.keyCenter.stringLiteral(withKeySpelling: self.model.currentKey.spelling)}
    var primaryNearKeySharpLabelString : String {self.model.currentKey.nearKeySharp.keyCenter.stringLiteral(withKeySpelling: self.model.currentKey.spelling)}
    var relativeKeyLabelString : String {self.model.currentKey.relativeKey.keyCenter.stringLiteral(withKeySpelling: self.model.currentKey.spelling)}
    var relativeNearKeyFlatLabelString : String {self.model.currentKey.relativeKey.nearKeyFlat.keyCenter.stringLiteral(withKeySpelling: self.model.currentKey.spelling)}
    var relativeNearKeySharpLabelString : String {self.model.currentKey.relativeKey.nearKeySharp.keyCenter.stringLiteral(withKeySpelling: self.model.currentKey.spelling)}
    
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
