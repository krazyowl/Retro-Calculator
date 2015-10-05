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
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    // Functions
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
    
    func buttonSound() {
        if btnSound.playing {
           btnSound.stop()
        }
        
        btnSound.play()

    }
    
    func processOperation(op: Operation) {
        buttonSound()
        
        if currentOperation != Operation.Empty {
            
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Int(leftValStr)! * Int(rightValStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Int(leftValStr)! / Int(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Int(leftValStr)! - Int(rightValStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Int(leftValStr)! + Int(rightValStr)!)"
                }
                
                leftValStr = result
                outputLabel.text = result
            }
            
            currentOperation = op
            
            
        } else {
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
    
    // Actions
        // Number Buttons
    @IBAction func numberPressed(btn: UIButton!) {
        buttonSound()
        runningNumber += "\(btn.tag)"
        outputLabel.text = runningNumber
        
    }
    
    
        // Operator Buttons
    @IBAction func divideButton(sender: UIButton) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func multiplyButton(sender: UIButton) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func subtractButton(sender: UIButton) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func additionButton(sender: UIButton) {
        processOperation(Operation.Add)
    }
    
    @IBAction func equalButton(sender: UIButton) {
        processOperation(currentOperation)
    }
    
    
    
}

