//
//  OptionsViewModel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import Foundation
import SwiftUI

class OptionsViewModel : ObservableObject {
    
    @Published var model : OptionsModel = OptionsModel()
    
    // MARK: Featured Tonality
    lazy var featuredTonalityBinding = Binding<Int>(
        get: {return self.model.featuredTonalityIndex},
        set: {i in
            self.model.featuredTonalityIndex = i
            self.model.currentKeyIndex = self.model.currentKey.relativeKey.keyCenter.rawValue
            self.model.saveOptions()
            self.printInfo()
            print(self.model.currentKey.name())
        })
    let tonalities : [Tonality] = Tonality.all
    

    // MARK: Key Selection Method
    lazy var keySelectionBinding = Binding<Int>(
        get: {return self.model.keySelectionMethodIndex},
        set: {i in
            self.model.keySelectionMethodIndex = i
            self.model.saveOptions()
            self.printInfo()
        })
    let keySelectionMethods : [KeySelectionMethod] = KeySelectionMethod.all
    
    
    // MARK: Numeric Symbol Type
    lazy var symbolTypeBinding = Binding<Int>(
        get: {return self.model.symbolTypeIndex},
        set: {i in
            self.model.symbolTypeIndex = i
            self.model.saveOptions()
            self.printInfo()
        })
    let symbolTypes : [NumericSymbolType] = NumericSymbolType.all
    
    // MARK: Preferred Spelling
    lazy var preferredSpellingBinding = Binding<Int>(
        get: {return self.model.preferredSpellingIndex},
        set: {i in
            self.model.preferredSpellingIndex = i
            self.model.saveOptions()
            self.printInfo()
        })
    let preferredSpellingTypes : [KeySpelling] = KeySpelling.all
    let preferredSpellingStrings : [String] = [
        "G" + flatSymbol + "Major / E" + flatSymbol + "minor",
        "F" + sharpSymbol + "Major / D" + sharpSymbol + "minor"
    ]
    
    //MARK: For Testing Only!!!
    func printInfo() {
        print("")
        print(self.model)
        print("")
    }
    
}
