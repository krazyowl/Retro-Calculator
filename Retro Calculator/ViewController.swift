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
    
    
    var btnSound: AVAudioPlayer!
    
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
    
    @IBAction func numberPressed(btn: UIButton!) {
        btnSound.play()
    }
    
    
}

