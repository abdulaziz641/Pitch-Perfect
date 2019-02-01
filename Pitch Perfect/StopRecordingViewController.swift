//
//  StopRecordingViewController.swift
//  Pitch Perfect
//
//  Created by Abdulaziz Alsaloum on 05/11/2018.
//  Copyright © 2018 Abdulaziz. All rights reserved.
//

import UIKit
import AVFoundation

class StopRecordingViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playRecording" {
            let playSoundsVC = segue.destination as! PlaySoundViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "playRecording", sender: audioRecorder.url)
            print("Audio Recorder URL from SSVC: \n\(audioRecorder.url)")
        }else {
            print("Recodring had an issue")
        }
    }
}
