//
//  UserOptions.swift
//  Theory Wheel
//
//  Created by mightknow on 10/6/20.
//

import Foundation

class UserOptions : ObservableObject {
    
    //MARK: Singleton
    static let current : UserOptions = UserOptions()
    
    // MARK: Properties
    @Published var featuredTonalityIndex : Int = 0
    let tonalities : [Tonality] = [.major, .minor]
    var featuredTonality : Tonality {
        return self.tonalities[self.featuredTonalityIndex]
    }
    
    @Published var keySelectionMethodIndex : Int = 0
    let keySelectionMethods : [String] = ["Key Name", "# of Accidentals"]
    
    @Published var symbolTypeIndex : Int = 0
    let symbolTypes : [String] = ["Traditional", "Nashville"]
    
    // MARK: Storage and Initialization
    private var keys : [String] = ["featuredTonality", "keySelectionMethod", "symbolType"]
    func save() {
        UserDefaults.standard.set(self.featuredTonalityIndex, forKey: self.keys[0])
        UserDefaults.standard.set(self.keySelectionMethodIndex, forKey: self.keys[1])
        UserDefaults.standard.set(self.symbolTypeIndex, forKey: self.keys[2])
    }
    private func load() {
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
    private init() {
        self.load()
    }
    
}
