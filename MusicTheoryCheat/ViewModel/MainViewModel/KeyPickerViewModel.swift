//
//  KeyPickerViewModel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/8/20.
//

import Foundation
import SwiftUI

extension ViewModel {
    
    // Display proper order based on chosen options
    var keyOrder : [PitchClass] {
        var array : [PitchClass] = []
        if self.model.keySelectionMethod == .keyName {
            array = PitchClass.all
        } else {
            var startingNote : PitchClass {
                if self.model.featuredTonality == .major {
                    return self.model.preferredSpelling == .flats ? .gFlat : .dFlat
                } else {
                    return self.model.preferredSpelling == .flats ? .eFlat : .bFlat
                }
            }
            array.append(startingNote)
            while array.count < 12 {
                let next = array.last!.pitchClassFor(7, stepsInDirection: .up)
                array.append(next)
            }
        }
        return array
    }
    // Display proper string for chosen options
    var pickerStrings : [String] {
        var array : [String] = []
        let roots = self.keyOrder
        if self.model.keySelectionMethod == .keyName {
            for e in roots {
                let key = Key(keyCenter: e, tonality: self.model.featuredTonality, preferSharpSpelling: self.model.preferredSpelling == .sharps)
                array.append(key.noteString)
            }
        } else {
            var num : Int = self.model.preferredSpelling == .flats ? -6 : -5
            func add(_ i: Int) {
                let a = abs(i)
                let str = String(a)
                array.append(str)
            }
            add(num)
            while array.count < 12 {
                num += 1
                add(num)
            }
        }
        if self.model.featuredTonality == .minor {
            array = array.map {
                $0.lowercased()
            }
        }
        return array
    }
    
    // MARK: Selection Binding
    private func keyBindingGetter() -> Int {
        self.keyOrder.firstIndex(of: self.model.currentKey.keyCenter)!
    }
    private func keyBindingSetter(_ i: Int) {
        let keyCenter = self.keyOrder[i]
        self.model.currentKeyIndex = keyCenter.rawValue
        self.model.saveKey()
    }
    var keyBinding : Binding<Int> {
        Binding<Int>(
            get: self.keyBindingGetter,
            set: self.keyBindingSetter)
    }
    
    // MARK: Accidental Labels
    // COLOR
    private func colorFor(_ spelling: KeySpelling) -> Color {
        if self.model.currentKey ~= Key(keyCenter: .c, tonality: .major) {
            return CustomColors.graySwift
        } else {
            switch spelling == self.model.currentKey.spelling {
            case true:
                return CustomColors.accentSwift
            case false:
                return CustomColors.graySwift
            }
        }
    }
    var flatsColor : Color {
        self.colorFor(.flats)
    }
    var sharpsColor : Color {
        self.colorFor(.sharps)
    }
    // TEXT
    private var accidentalsString : String {
        var result = ""
        let arr = self.model.currentKey.accidentals
        if arr.isEmpty {
            result = " none"
        } else {
            for a in  arr {
                result.append(" \(a)")
            }
        }
        return result
    }
    var flatsString : String {
        var string = "flats :"
        if self.model.currentKey.spelling == .flats {
            string.append(self.accidentalsString)
        } else {
            string.append(" none")
        }
        return string
    }
    var sharpsString : String {
        var string = "sharps :"
        if self.model.currentKey.spelling == .sharps {
            string.append(self.accidentalsString)
        } else {
            string.append(" none")
        }
        return string
    }
}
