//
//  Sequencer.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/26/20.
//

import Foundation

class Sequencer {
    
    private let soundPlayer : SoundFontPlayer
    private var timer : Timer = Timer()
    private let chordDuration : Double = 2
    private let beatsPerMinute : Int = 180
    func playMelody(withNotes notes: [UInt8]) {
        self.endSequence()
    }
    @objc func progress(toSequenceStep: Int) {
        
    }
    @objc func endSequence() {
        self.soundPlayer.allNotesOff()
        self.timer.invalidate()
    }
    func playChord(withNotes notes: [UInt8]) {
        self.endSequence()
        for note in notes {
            self.soundPlayer.start(note: note)
        }
        self.timer = Timer.scheduledTimer(timeInterval: self.chordDuration, target: self, selector: #selector(self.endSequence), userInfo: nil, repeats: false)
    }
    
    init(soundPlayer: SoundFontPlayer) {
        self.soundPlayer = soundPlayer
    }
    
}
