//
//  Info.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/12/20.
//

import Foundation

enum InfoKey : String, CaseIterable {
    
    // MARK: OptionsView Keys
    case keySelectionMethod = "Key Selection Method" // 0
    case featuredTonality = "Featured Tonality" // 1
    case symbolType = "Numbering Type" // 2
    case preferredEnharmonicSpelling = "Preferred Enharmonic Spelling" // 3
    case chordType = "Chord Type" // 4
    
    // MARK: MainView Keys
    // Key Selector
    case keySelector = "Key Selector" // 5
    // Primary Key Row
    case primaryNearKeyFlat = "Near Key (Flats)" // 6
    case primaryKey = "Primary Key" // 7
    case primaryNearKeySharp = "Near Key (Sharps)" // 8
    // Scale Degree 1
    case primaryKeyScaleDegreeNumberOne = "Scale Degree Number One" // 9
    case rootForScaleDegreeOne = "Root for Chord Built on Scale Degree One" // 10
    case thirdForScaleDegreeOne = "Third for Chord Built on Scale Degree One" // 11
    case fifthForScaleDegreeOne = "Fifth for Chord Built on Scale Degree One" // 12
    case seventhForScaleDegreeOne = "Seventh for Chord Built on Scale Degree One" // 13
    case relativeKeyScaleDegreeNumberOne = "Relative Key Scale Degree Number One" // 14
    // Scale Degree 2
    case primaryKeyScaleDegreeNumberTwo = "Scale Degree Number Two" // 15
    case rootForScaleDegreeTwo = "Root for Chord Built on Scale Degree Two" // 16
    case thirdForScaleDegreeTwo = "Third for Chord Built on Scale Degree Two" // 17
    case fifthForScaleDegreeTwo = "Fifth for Chord Built on Scale Degree Two" // 18
    case seventhForScaleDegreeTwo = "Seventh for Chord Built on Scale Degree Two" // 19
    case relativeKeyScaleDegreeNumberTwo = "Relative Key Scale Degree Number Two" // 20
    // Scale Degree 3
    case primaryKeyScaleDegreeNumberThree = "Scale Degree Number Three" // 21
    case rootForScaleDegreeThree = "Root for Chord Built on Scale Degree Three" // 22
    case thirdForScaleDegreeThree = "Third for Chord Built on Scale Degree Three" // 23
    case fifthForScaleDegreeThree = "Fifth for Chord Built on Scale Degree Three" // 24
    case seventhForScaleDegreeThree = "Seventh for Chord Built on Scale Degree Three" // 25
    case relativeKeyScaleDegreeNumberThree = "Relative Key Scale Degree Number Three" // 26
    // Scale Degree 4
    case primaryKeyScaleDegreeNumberFour = "Scale Degree Number Four" // 27
    case rootForScaleDegreeFour = "Root for Chord Built on Scale Degree Four" // 28
    case thirdForScaleDegreeFour = "Third for Chord Built on Scale Degree Four" // 29
    case fifthForScaleDegreeFour = "Fifth for Chord Built on Scale Degree Four" // 30
    case seventhForScaleDegreeFour = "Seventh for Chord Built on Scale Degree Four" // 31
    case relativeKeyScaleDegreeNumberFour = "Relative Key Scale Degree Number Four" // 32
    // Scale Degree 5
    case primaryKeyScaleDegreeNumberFive = "Scale Degree Number Five" // 33
    case rootForScaleDegree = "Root for Chord Built on Scale Degree Five" // 34
    case thirdForScaleDegree = "Third for Chord Built on Scale Degree Five" // 35
    case fifthForScaleDegree = "Fifth for Chord Built on Scale Degree Five" // 36
    case seventhForScaleDegree = "Seventh for Chord Built on Scale Degree Five" // 37
    case relativeKeyScaleDegreeNumber = "Relative Key Scale Degree Number Five" // 38
    // Scale Degree 6
    case primaryKeyScaleDegreeNumberSix = "Scale Degree Number Six" // 39
    case rootForScaleDegreeSix = "Root for Chord Built on Scale Degree Six" // 40
    case thirdForScaleDegreeSix = "Third for Chord Built on Scale Degree Six" // 41
    case fifthForScaleDegreeSix = "Fifth for Chord Built on Scale Degree Six" // 42
    case seventhForScaleDegreeSix = "Seventh for Chord Built on Scale Degree Six" // 43
    case relativeKeyScaleDegreeNumberSix = "Relative Key Scale Degree Number Six" // 44
    // Scale Degree 7
    case primaryKeyScaleDegreeNumberSeven = "Scale Degree Number Seven" // 45
    case rootForScaleDegreeSeven = "Root for Chord Built on Scale Degree Seven" // 46
    case thirdForScaleDegreeSeven = "Third for Chord Built on Scale Degree Seven" // 47
    case fifthForScaleDegreeSeven = "Fifth for Chord Built on Scale Degree Seven" // 48
    case seventhForScaleDegreeSeven = "Seventh for Chord Built on Scale Degree Seven" // 49
    case relativeKeyScaleDegreeNumberSeven = "Relative Key Scale Degree Number Seven" // 50
    // Relative Key Row
    case relativeNearKeyFlat = "Near Key (Flats) for Relative Key" // 51
    case relativeKey = "Primary Key for Relative Key" // 52
    case relativeNearKeySharp = "Near Key (Sharps) for Relative Key" // 53
    
}

struct Info {
    
    static let details : [String: String] = [
        
        // MARK: OptionsView Details
        InfoKey.allCases[0].rawValue :
            "This option determines the appearance and functionality of the key selector at the top of the main view.\n\n '\(KeySelectionMethod.byAccidentals.rawValue)' is for selecting keys based on the number of accidentals in the key signature. Flats are to the left and sharps are to the right. Thus, selecting '0' will display C Major and A minor. Selecting the '1' to the left of that would display F Major / D minor; and the '1' to the right would display G Major / E minor.\n\n'\(KeySelectionMethod.keyName.rawValue)' is for selecting the key based on the actual key name.",
        InfoKey.allCases[1].rawValue :
            "This option determines which tonality is displayed at the top of the main screen with its corresponding scale degrees on the left.",
        InfoKey.allCases[2].rawValue :
            "This option determines which method of representing the scale degrees is used on the main view.\n\n\(NumericSymbolType.romanNumerals.rawValue) displays the more traditional Roman Numerals used in Classical and Jazz theory. Upper and lower case indicate major or minor tonality of the chord based on that scale degree.\n\n\(NumericSymbolType.nashvilleNumbers.rawValue) displays regular Arabic Numerals (1, 2, 3, etc.) to represent the scale degrees, as in the 'Nashville Numbers' shorthand. In Nashville Numbers, the chord quality (major/minor/diminished/etc.) is assumed to be a diatonic triad, and a distinction is only made if this is not the case.",
        InfoKey.allCases[3].rawValue :
            "This option is a matter of personal preference, and determines how to display the keys with 6 accidentals.",
        InfoKey.allCases[4].rawValue :
            "This option determines whether the chords in the main view will be basic Triads (3-note chords) or 7th chords (4-note chords).",
        
        // MARK: MainView Details
        // Key Selector
        InfoKey.allCases[5].rawValue :
            "This is the Key Selector. This is where you choose the key for the information that is displayed. You can choose keys based on the number of accidendals, or by key name. This preference can be changed in the options view.",
        // Primary Key Row
        InfoKey.allCases[6].rawValue : "This is one of the closely related keys to the main key displayed on the page, differing by having only one more flat (or one fewer sharp). It is also the key based on the 4th note of the main key.",
        InfoKey.allCases[7].rawValue : "This is the main key that is selected by the key selector above, to which all information on this screen relates.",
        InfoKey.allCases[8].rawValue : "This is one of the closely related keys to the main key displayed on the page, differing by having only one more sharp (or one fewer flats). It is also the key based on the 5th note of the main key.",
        // Scale Degree 1
        InfoKey.allCases[9].rawValue : "This number indicates how the chord displayed in this row relates to the selected key. This chord is also referred to as the Tonic chord.",
        InfoKey.allCases[10].rawValue : "This is the note that relates to the scale degree indicated to the left, and the root of the chord built from that scale degree.",
        InfoKey.allCases[11].rawValue : "This is the 3rd of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[12].rawValue : "This is the 5th of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[13].rawValue : "This is the 7th of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[14].rawValue : "This number indicates how the chord in this row relates to the relative key of the main key.",
        // Scale Degree 2
        InfoKey.allCases[15].rawValue : "This number indicates how the chord displayed in this row relates to the selected key. This chord is also referred to as the Supertonic chord.",
        InfoKey.allCases[16].rawValue : "This is the note that relates to the scale degree indicated to the left, and the root of the chord built from that scale degree.",
        InfoKey.allCases[17].rawValue : "This is the 3rd of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[18].rawValue : "This is the 5th of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[19].rawValue : "This is the 7th of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[20].rawValue : "This number indicates how the chord in this row relates to the relative key of the main key.",
        // Scale Degree 3
        InfoKey.allCases[21].rawValue : "This number indicates how the chord displayed in this row relates to the selected key. This chord is also referred to as the Mediant chord.",
        InfoKey.allCases[22].rawValue : "This is the note that relates to the scale degree indicated to the left, and the root of the chord built from that scale degree.",
        InfoKey.allCases[23].rawValue : "This is the 3rd of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[24].rawValue : "This is the 5th of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[25].rawValue : "This is the 7th of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[26].rawValue : "This number indicates how the chord in this row relates to the relative key of the main key.",
        // Scale Degree 4
        InfoKey.allCases[27].rawValue : "This number indicates how the chord displayed in this row relates to the selected key. This chord is also referred to as the Subdominant chord.",
        InfoKey.allCases[28].rawValue : "This is the note that relates to the scale degree indicated to the left, and the root of the chord built from that scale degree.",
        InfoKey.allCases[29].rawValue : "This is the 3rd of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[30].rawValue : "This is the 5th of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[31].rawValue : "This is the 7th of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[32].rawValue : "This number indicates how the chord in this row relates to the relative key of the main key.",
        // Scale Degree 5
        InfoKey.allCases[33].rawValue : "This number indicates how the chord displayed in this row relates to the selected key. This chord is also referred to as the Dominant chord.",
        InfoKey.allCases[34].rawValue : "This is the note that relates to the scale degree indicated to the left, and the root of the chord built from that scale degree.",
        InfoKey.allCases[35].rawValue : "This is the 3rd of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[36].rawValue : "This is the 5th of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[37].rawValue : "This is the 7th of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[38].rawValue : "This number indicates how the chord in this row relates to the relative key of the main key.",
        // Scale Degree 6
        InfoKey.allCases[39].rawValue : "This number indicates how the chord displayed in this row relates to the selected key. This chord is also referred to as the Submediant chord.",
        InfoKey.allCases[40].rawValue : "This is the note that relates to the scale degree indicated to the left, and the root of the chord built from that scale degree.",
        InfoKey.allCases[41].rawValue : "This is the 3rd of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[42].rawValue : "This is the 5th of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[43].rawValue : "This is the 7th of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[44].rawValue : "This number indicates how the chord in this row relates to the relative key of the main key.",
        // Scale Degree 7
        InfoKey.allCases[45].rawValue : "This number indicates how the chord displayed in this row relates to the selected key. This chord is also referred to as the Subtonic (for \(flatSymbol)7th, a whole step below the Tonic) or Leading Tone (for raised 7th, a half step below the tonic) chord.",
        InfoKey.allCases[46].rawValue : "This is the note that relates to the scale degree indicated to the left, and the root of the chord built from that scale degree.",
        InfoKey.allCases[47].rawValue : "This is the 3rd of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[48].rawValue : "This is the 5th of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[49].rawValue : "This is the 7th of the chord that is built on the scale degree indicated to the left.",
        InfoKey.allCases[50].rawValue : "This number indicates how the chord in this row relates to the relative key of the main key.",
        // Relative Key Row
        InfoKey.allCases[51].rawValue : "This is one of the closely related keys to the relative key of the main key displayed on the page, differing by having only one more flat (or one fewer sharp). It is also the key based on the 4th note of the relative key.",
        InfoKey.allCases[52].rawValue : "This is the relative key to the main key that is selected by the key selector at the top. If the main key is of major tonality, this is the relative minor. Likewise, if the main key is of minor tonality, this is the relative major.",
        InfoKey.allCases[53].rawValue : "This is one of the closely related keys to the relative key of the main key displayed on the page, differing by having only one more sharp (or one fewer flats). It is also the key based on the 5th note of the relative key.",
        
        
    ]
    
}
