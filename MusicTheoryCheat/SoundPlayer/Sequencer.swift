//
//  Sequencer.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/26/20.
//

import Foundation

class Sequencer {
    
    static let shared = Sequencer()
    private let soundPlayer : SoundFontPlayer
    private var timer : Timer = Timer()
    private let chordDuration : Double = 2
    private var currentNoteIndex = 0
    private var melodyNotes : [UInt8] = []
    private let melodyNoteDuration = 0.25
    func playMelody(withNotes notes: [UInt8]) {
        self.endSequence()
        self.melodyNotes = notes
        self.soundPlayer.start(note: melodyNotes[0])
        self.timer = Timer.scheduledTimer(timeInterval: self.melodyNoteDuration, target: self, selector: #selector(self.progressMelody), userInfo: nil, repeats: true)
    }
    @objc func progressMelody() {
        if self.currentNoteIndex >= self.melodyNotes.count - 1 {
            if self.currentNoteIndex == self.melodyNotes.count {
                self.endSequence()
            }
            self.currentNoteIndex += 1
        } else {
            self.soundPlayer.stop(note: self.melodyNotes[self.currentNoteIndex])
            self.currentNoteIndex += 1
            self.soundPlayer.start(note: self.melodyNotes[self.currentNoteIndex])
        }
    }
    @objc func endSequence() {
        self.soundPlayer.allNotesOff()
        self.timer.invalidate()
        self.currentNoteIndex = 0
    }
    func playChord(withNotes notes: [UInt8]) {
        self.endSequence()
        for note in notes {
            self.soundPlayer.start(note: note)
        }
        self.timer = Timer.scheduledTimer(timeInterval: self.chordDuration, target: self, selector: #selector(self.endSequence), userInfo: nil, repeats: false)
    }
    
    private init() {
        self.soundPlayer = SoundFontPlayer()!
    }
    
}
