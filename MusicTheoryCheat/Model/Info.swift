//
//  Info.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/12/20.
//

import Foundation

struct Info {
    
    static let keys : [String] = [
        "Option: Key Selection Method",
        "Option: Featured Tonality",
        "Option: Symbol Type",
        "Option: Preferred Enharmonic Spelling"
    ]
    
    static let details : [String: String] = [
        
        "Option: Key Selection Method" : "This option determines the appearance and functionality of the key selector at the top of the main view.\n\n '\(KeySelectionMethod.byAccidentals.rawValue)' is for selecting keys based on the number of accidentals in the key signature. Flats are to the left and sharps are to the right. Thus, selecting '0' will display C Major and A minor. Selecting the '1' to the left of that would display F Major / D minor; and the '1' to the right would display G Major / E minor.\n\n'\(KeySelectionMethod.keyName.rawValue)' is for selecting the key based on the actual key name.",
        
        
        "Option: Featured Tonality" : "This option determines which tonality is displayed at the top of the main screen with its corresponding scale degrees on the left.",
        
        "Option: Symbol Type" : "This option determines which method of representing the scale degrees is used on the main view.\n\n\(NumericSymbolType.romanNumerals.rawValue) displays the more traditional Roman Numerals used in Classical and Jazz theory. Upper and lower case indicate major or minor tonality of the chord based on that scale degree.\n\n\(NumericSymbolType.nashvilleNumbers.rawValue) displays regular Arabic Numerals (1, 2, 3, etc.) to represent the scale degrees, as in the 'Nashville Numbers' shorthand. In Nashville Numbers, the chord quality (major/minor/diminished/etc.) is assumed to be a diatonic triad, and a distinction is only made if this is not the case.",
        
        "Option: Preferred Enharmonic Spelling" : "This option is a matter of personal preference, and determines how to display the keys with 6 accidentals."
        
    ]
    
    static func getDetailString(forIndex i: Int) -> String {
        return Self.details[Self.keys[i]]!
    }
    
}
