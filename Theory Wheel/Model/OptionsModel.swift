//
//  OptionsModel.swift
//  Theory Wheel
//
//  Created by mightknow on 10/6/20.
//

import Foundation

struct OptionsModel : Codable {
    
    var featuredTonalityIndex : Int = 0
    var keySelectionMethodIndex : Int = 0
    var symbolTypeIndex : Int = 0
    var currentKeyIndex : Int = 0
    
    private var keys : [String] = ["featuredTonality", "keySelectionMethod", "symbolType"]
    func save() {
        UserDefaults.standard.set(self.featuredTonalityIndex, forKey: self.keys[0])
        UserDefaults.standard.set(self.keySelectionMethodIndex, forKey: self.keys[1])
        UserDefaults.standard.set(self.symbolTypeIndex, forKey: self.keys[2])
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
                default:
                    break
                }
            }
        }
    }
    init() {
        self.load()
    }
    
}
