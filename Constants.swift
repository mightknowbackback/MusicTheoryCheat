//
//  Constants.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import Foundation

let flatSymbol : String = "♭"
let naturalSymbol : String = "♮"
let sharpSymbol : String = "♯"
let diminishedSymbol : String = "º"
let majorScaleIntervals : [Int] = [0, 2, 4, 5, 7, 9, 11]
let minorScaleIntervals : [Int] = [0, 2, 3, 5, 7, 8, 10]
let majorRomanNumerals : [String] = ["I", "ii", "iii", "IV", "V", "vi", "vii" + diminishedSymbol]
let minorRomanNumerals : [String] = Array(majorRomanNumerals[5...7]) + Array(majorRomanNumerals[0...5])
let majorNashvilleNumbers : [String] = ["1", "2", "3", "4", "5", "6", "7"]
let minorNashvilleNumbers : [String] = Array(majorNashvilleNumbers[5...7]) + Array(majorNashvilleNumbers[0...5])
