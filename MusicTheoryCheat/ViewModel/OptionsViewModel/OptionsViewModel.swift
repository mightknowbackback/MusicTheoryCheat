//
//  OptionsViewModel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/9/20.
//

import Foundation
import SwiftUI

extension ViewModel {
    
    // MARK: Featured Tonality
    var featuredTonalityBinding : Binding<Int> {
        Binding<Int>(
            get: {return self.model.featuredTonalityIndex},
            set: {i in
                self.model.featuredTonalityIndex = i
                self.model.currentKeyIndex = self.model.currentKey.relativeKey.keyCenter.rawValue
                self.model.saveOptions()
                self.printInfo()
                print(self.model.currentKey.name)
        })
    }

    // MARK: Key Selection Method
    var keySelectionBinding : Binding<Int> {
        Binding<Int>(
            get: {return self.model.keySelectionMethodIndex},
            set: {i in
                self.model.keySelectionMethodIndex = i
                self.model.saveOptions()
                self.printInfo()
        })
    }
    
    // MARK: Numeric Symbol Type
    var symbolTypeBinding : Binding<Int> {
        Binding<Int>(
            get: {return self.model.symbolTypeIndex},
            set: {i in
                self.model.symbolTypeIndex = i
                self.model.saveOptions()
                self.printInfo()
        })
    }
    
    // MARK: Preferred Spelling
    var preferredSpellingBinding : Binding<Int> {
        Binding<Int>(
            get: {return self.model.preferredSpellingIndex},
            set: {i in
                self.model.preferredSpellingIndex = i
                self.model.saveOptions()
                self.printInfo()
        })
    }
    
}
