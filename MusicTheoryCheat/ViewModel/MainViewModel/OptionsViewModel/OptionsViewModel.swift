//
//  OptionsViewModel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/9/20.
//

import Foundation
import SwiftUI

extension ViewModel {
    
    var featuredTonalityBinding : Binding<Int> {
        Binding<Int>(
            get: {return self.model.featuredTonalityIndex},
            set: {i in
                self.model.featuredTonalityIndex = i
                self.model.currentKeyIndex = self.model.currentKey.relativeKey.keyCenter.rawValue
                self.model.saveOptions()
                print(self.model.currentKey.name)
        })
    }

    var keySelectionBinding : Binding<Int> {
        Binding<Int>(
            get: {return self.model.keySelectionMethodIndex},
            set: {i in
                self.model.keySelectionMethodIndex = i
                self.model.saveOptions()
        })
    }
    
    var symbolTypeBinding : Binding<Int> {
        Binding<Int>(
            get: {return self.model.symbolTypeIndex},
            set: {i in
                self.model.symbolTypeIndex = i
                self.model.saveOptions()
        })
    }
    
    var preferredSpellingBinding : Binding<Int> {
        Binding<Int>(
            get: {return self.model.preferredSpellingIndex},
            set: {i in
                self.model.preferredSpellingIndex = i
                self.model.saveOptions()
        })
    }
    
}
