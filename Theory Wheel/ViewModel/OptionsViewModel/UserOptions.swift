//
//  UserOptions.swift
//  Theory Wheel
//
//  Created by mightknow on 10/6/20.
//

import Foundation
import SwiftUI

class UserOptions : ObservableObject {
    
    @Published var model : OptionsModel = OptionsModel()
    
    // MARK: Properties
    lazy var featuredTonalityBinding = Binding<Int>(
        get: {return self.model.featuredTonalityIndex},
        set: {i in
            self.model.featuredTonalityIndex = i
            self.model.save()
        })
    let keySelectionMethods : [String] = ["Key Name", "# of Accidentals"]
    lazy var keySelectionBinding = Binding<Int>(
        get: {return self.model.keySelectionMethodIndex},
        set: {i in
            self.model.keySelectionMethodIndex = i
            self.model.save()
        })
    let symbolTypes : [String] = ["Traditional", "Nashville"]
    lazy var symbolTypeBinding = Binding<Int>(
        get: {return self.model.symbolTypeIndex},
        set: {i in
            self.model.symbolTypeIndex = i
            self.model.save()
        })
    
}
