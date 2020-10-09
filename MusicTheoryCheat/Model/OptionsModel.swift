//
//  OptionsModel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import Foundation

enum KeySelectionMethod : String {
    case byAccidentals = "# of Accidentals", keyName = "Key Name"
    static var all : [KeySelectionMethod] = [.byAccidentals, .keyName]
}
enum NumericSymbolType : String {
    case romanNumerals = "Roman Numerals", nashvilleNumbers = "Nashville Numbers"
    static var all : [NumericSymbolType] = [.romanNumerals, .nashvilleNumbers]
}

struct OptionsModel : Codable {
    
    // MARK: Properties
    var featuredTonalityIndex : Int = 0
    var featuredTonality : Tonality {
        Tonality.all[self.featuredTonalityIndex]
    }
    var keySelectionMethodIndex : Int = 0
    var keySelectionMethod : KeySelectionMethod {
        KeySelectionMethod.all[self.keySelectionMethodIndex]
    }
    var symbolTypeIndex : Int = 0
    var symbolType : NumericSymbolType {
        NumericSymbolType.all[self.symbolTypeIndex]
    }
    var preferredSpellingIndex : Int = 0
    var preferredSpelling : KeySpelling {
        KeySpelling.all[self.preferredSpellingIndex]
    }
    var currentKeyIndex : Int = 0
    var currentKey : Key {
        var key = Key(keyCenter: PitchClass.pitchClassBy(noteNumber: self.currentKeyIndex), tonality: self.featuredTonality)
        if self.preferredSpelling == .sharps {
            key.preferSharpSpelling = true
        }
        return key
    }
    
    // MARK: Initializing and Storage
    private var keys : [String] = ["featuredTonality", "keySelectionMethod", "symbolType", "preferredSpelling", "currentKey"]
    func saveOptions() {
        UserDefaults.standard.set(self.featuredTonalityIndex, forKey: self.keys[0])
        UserDefaults.standard.set(self.keySelectionMethodIndex, forKey: self.keys[1])
        UserDefaults.standard.set(self.symbolTypeIndex, forKey: self.keys[2])
        UserDefaults.standard.set(self.preferredSpellingIndex, forKey: self.keys[3])
    }
    func saveKey() {
        UserDefaults.standard.set(self.currentKeyIndex, forKey: self.keys[4])
    }
    private mutating func load() {
        for i in 0..<self.keys.count {
            if let val = UserDefaults.standard.value(forKey: self.keys[i]) as? Int {
                switch i {
                case 0:
                    self.featuredTonalityIndex = val
                case 1:
                    self.keySelectionMethodIndex = val
                case 2:
                    self.symbolTypeIndex = val
                case 3:
                    self.preferredSpellingIndex = val
                case 4:
                    self.currentKeyIndex = val
                default:
                    break
                }
            }
        }
    }
    init() {
        self.load()
    }
    
    // MARK: FOR TESTING ONLY!!!
    func printValues() {
        print()
    }
    
}
