//
//  MainViewModel.swift
//  Theory Wheel
//
//  Created by mightknow on 10/6/20.
//

import Foundation
import SwiftUI

class MainViewModel : ObservableObject {
    
    private var options : OptionsModel
    
    @Published var key : Key
    
    lazy var keyBinding = Binding<Int>(
        get: {self.options.currentKeyIndex},
        set: {i in
            self.options.currentKeyIndex = i
            self.options.save()
        })
    init(_ options: OptionsModel) {
        self.options = options
        self.key = Key(keyCenter: PitchClass.all[options.currentKeyIndex], tonality: Tonality.all[options.featuredTonalityIndex])
    }
}
