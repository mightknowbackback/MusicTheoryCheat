//
//  Playable.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/26/20.
//

import Foundation
import SwiftUI

protocol Playable {
    func play()
    var notes : [UInt8] {get}
}
