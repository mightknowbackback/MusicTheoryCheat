//
//  SoundPlayer.swift
//  Parts Tester
//
//  Created by mightknow on 1/5/18.
//  Copyright © 2018 Euphorophonics. All rights reserved.
//

import Foundation
import AVFoundation

struct SoundFontPlayer {
	
	private let engine = AVAudioEngine()
	private let player = AVAudioPlayerNode()
	private let sampler = AVAudioUnitSampler()
    private let soundFont : URL = Bundle.main.url(forResource: "Piano", withExtension: "sf2")!
//	var transpositionOffset : UInt8 = 0
//	var transpositionDirection : TranspositionDirection = .up
//	enum TranspositionDirection {
//		case up
//		case down
//	}
	init?() {
//        self.soundFont = self.soundFont
//		self.transpositionDirection = font.2
//		self.transpositionOffset = font.3
		engine.attach(player)
		engine.connect(player, to: engine.mainMixerNode, format: engine.mainMixerNode.outputFormat(forBus: 0))
		engine.attach(sampler)
		engine.connect(sampler, to: engine.outputNode, format: nil)
		
		do {
			try engine.start()
		}
		catch let e {
			print(e)
			return nil
		}
		do {
//			func noteOn(_ sender: UIButton) {
//			}
//            self.start(note: 60)
            try sampler.loadSoundBankInstrument(at: self.soundFont, program: 0, bankMSB: UInt8(kAUSampler_DefaultMelodicBankMSB), bankLSB: 0)
		}
		catch let e {
			print(e)
			return nil
		}
	}
//	private func convertNote(note: UInt8) -> UInt8 {
//		var note : UInt8 = note
//		switch self.transpositionDirection {
//		case .up:
//			note += self.transpositionOffset
//		case .down:
//			note -= self.transpositionOffset
//		}
//		return note
//	}
    
    func start(note: UInt8, velocity: UInt8 = 100) {
//        let note = self.convertNote(note: note)
        sampler.startNote(note, withVelocity: velocity, onChannel: 0)
    }
    func stop(note: UInt8) {
//        let note = self.convertNote(note: note)
        sampler.stopNote(note, onChannel: 0)
    }
    func allNotesOff() {
        for note in 0...128 {
            self.stop(note: UInt8(note))
        }
    }
}
