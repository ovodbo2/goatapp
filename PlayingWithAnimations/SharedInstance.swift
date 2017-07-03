//
//  SharedInstance.swift
//  PlayingWithAnimations
//
//  Created by Derek on 7/1/17.
//  Copyright © 2017 DboTheGoat. All rights reserved.
//

import UIKit
import AVFoundation

class SharedInstance: NSObject {
    static let share = SharedInstance()
    let dummyData = ["Luke", "Anakin", "Yoda", "Mace", "ObiWan", "Rey", "Kylo", "R2D2", "C3PO", "Poe", "Finn", "Han", "QuiGon", "Lando", "BB8", "Chewy"]
    var voices = [AVSpeechSynthesisVoice]()
    
    func getVoices() {
        for voice in AVSpeechSynthesisVoice.speechVoices() {
            SharedInstance.share.voices.append(voice)
        }
    }
}
