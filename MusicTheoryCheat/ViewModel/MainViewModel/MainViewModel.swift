//
//  MainViewModel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import Foundation
import SwiftUI

class MainViewModel : ObservableObject {
    
    var options : OptionsViewModel
    
    // Display proper order based on chosen options
    var keyOrder : [PitchClass] {
        var array : [PitchClass] = []
        if self.options.model.keySelectionMethod == .keyName {
            array = PitchClass.all
        } else {
            var startingNote : PitchClass {
                if self.options.model.featuredTonality == .major {
                    return self.options.model.preferredSpelling == .flats ? .gFlat : .dFlat
                } else {
                    return self.options.model.preferredSpelling == .flats ? .eFlat : .bFlat
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
    var pickerStrings : [String] {
        var array : [String] = []
        let roots = self.keyOrder
        if self.options.model.keySelectionMethod == .keyName {
            for e in roots {
                if e == .gFlat && self.options.model.preferredSpelling == .sharps {
                    array.append(e.stringLiteral(withKeySpelling: .sharps))
                } else {
                    array.append(e.stringLiteral())
                }
            }
        } else {
            var num : Int = self.options.model.preferredSpelling == .flats ? -6 : -5
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
        return array
    }
    
    // MARK: Binding for Picker
    private func keyBindingGetter() -> Int {
        self.keyOrder.firstIndex(of: self.options.model.currentKey.keyCenter)!
    }
    private func keyBindingSetter(_ i: Int) {
        let keyCenter = self.keyOrder[i]
        self.options.model.currentKeyIndex = keyCenter.rawValue
        self.options.model.saveKey()
        self.printKeyName()
        print(self.options)
    }
    lazy var keyBinding = Binding<Int>(
        get: self.keyBindingGetter,
        set: self.keyBindingSetter)
    
    // MARK: Initialization
    init(_ options: OptionsViewModel) {
        self.options = options
//        self.key = Key(keyCenter: PitchClass.all[options.model.currentKeyIndex], tonality: Tonality.all[options.model.featuredTonalityIndex])
        self.printKeyName()
    }
    
    // MARK: FOR TESTING ONLY!!!
    private func printKeyName() {
        print("Key is \(self.options.model.currentKey.name)")
    }
}
