//
//  OptionsViewModel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import Foundation
import SwiftUI

class ViewModel : ObservableObject {
    
    @Published var model : OptionsModel = OptionsModel()
    @Published var showInfoClickables : Bool = false
    @Published var infoText : String = ""
    @Published var infoViewIsShowing : Bool = false
    
    let tonalities : [Tonality] = Tonality.all
    let keySelectionMethods : [KeySelectionMethod] = KeySelectionMethod.all
    let symbolTypes : [NumericSymbolType] = NumericSymbolType.all
    let preferredSpellingTypes : [KeySpelling] = KeySpelling.all
    let preferredSpellingStrings : [String] = [
        "G" + flatSymbol + "Major / E" + flatSymbol + "minor",
        "F" + sharpSymbol + "Major / D" + sharpSymbol + "minor"
    ]
    
    //MARK: FOR TESTING ONLY!!!
    func printInfo() {
        print("")
        print("Key is \(self.model.currentKey.name)")
        print(self.model)
        print("")
    }
}
