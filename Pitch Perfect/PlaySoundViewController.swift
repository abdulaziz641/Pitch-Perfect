//
//  PlaySoundViewController.swift
//  Pitch Perfect
//
//  Created by Abdulaziz Alsaloum on 31/10/2018.
//  Copyright © 2018 Abdulaziz. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunckButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    var playSVC: UIViewController!
    
    let buttonsTags = [0, 1, 2, 3, 4, 5]
    
    enum ButtonType: Int {
        case snail = 0, rabbit, chipMunk, vader, echo, reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.configureUI(.notPlaying)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    @IBAction func playAudio(sender: UIButton) {
        let buttonType = ButtonType(rawValue: sender.tag)!
        switch (buttonType) {
        case .snail:
            playSound(rate: 0.5)
            sender.isHighlighted = true
        case .rabbit:
            playSound(rate: 1.5)
            sender.isHighlighted = true
        case .chipMunk:
            playSound(pitch: 1000)
            sender.isHighlighted = true
        case .vader:
            playSound(pitch: -1000)
            sender.isHighlighted = true
        case .echo:
            playSound(echo: true)
            sender.isHighlighted = true
        case .reverb:
            playSound(reverb: true)
            sender.isHighlighted = true
        }
        configureUI(.playing)
    }
    
    @IBAction func pauseAudio (sender: UIButton) {
        stopAudio()
    }
    
    
    @IBAction func recordNewSound(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
