//
//  ViewController.swift
//  Retro Calculator
//
//  Created by Jose Gonzales Jr on 10/5/15.
//  Copyright © 2015 Krazyowl. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var outputLabel: UILabel!
    
    // Properties
        // Sound
    var btnSound: AVAudioPlayer!
    
        // Numbers
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Button Sound Logic
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // Actions
        // Number Buttons
    @IBAction func numberPressed(btn: UIButton!) {
        btnSound.play()
    }
    
    
        // Operator Buttons
    @IBAction func divideButton(sender: UIButton) {
    }
    
    @IBAction func multiplyButton(sender: UIButton) {
    }
    
    @IBAction func subtractButton(sender: UIButton) {
    }
    
    @IBAction func additionButton(sender: UIButton) {
    }
    
    @IBAction func equalButton(sender: UIButton) {
    }
    
    
    
}

