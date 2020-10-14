//
//  OptionsViewModel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import Foundation
import SwiftUI

enum ScreenOrientation {
    case portrait, landscape
}

class ViewModel : ObservableObject {
    
    @Published var orientation : ScreenOrientation = .portrait
    @Published var model : Model = Model()
    @Published var showInfoClickables : Bool = false
    @Published var infoKey : InfoKey = .keySelectionMethod
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
