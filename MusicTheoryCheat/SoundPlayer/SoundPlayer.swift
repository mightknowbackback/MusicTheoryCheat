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
    
    func start(note: UInt8, velocity: UInt8 = 100) {
        sampler.startNote(note, withVelocity: velocity, onChannel: 0)
    }
    func stop(note: UInt8) {
        sampler.stopNote(note, onChannel: 0)
    }
    func allNotesOff() {
        for note in 0...128 {
            self.stop(note: UInt8(note))
        }
    }
    
	init?() {
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
            try sampler.loadSoundBankInstrument(at: self.soundFont, program: 0, bankMSB: UInt8(kAUSampler_DefaultMelodicBankMSB), bankLSB: 0)
		}
		catch let e {
			print(e)
			return nil
		}
	}
    
}
