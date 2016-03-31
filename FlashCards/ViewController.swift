//
//  ViewController.swift
//  FlashCards
//
//  Created by Matthew Helms on 3/16/16.
//  Copyright © 2016 Matthew Helms. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var vocabText: UILabel!
    
    var timer = NSTimer()
    let vocab = [
    "Let v.s. Var",
    "Computed Initializers",
    "Computed Variables",
    "Setter Observers",
    "Functions",
    "External Parameters",
    "Default Parameters",
    "Anonymous Functions",
    "Optional Chaining",
    "Failable Initializers",
    "Casting",
    "Class Methods",
    "Extensions",
    "Enumeration",
    "Error Handling",
    "Dictionaries",
    "Conditional Binding",
    "Protocols",
    "Inheritance",
    "Structs",
    "Enums",
    "Classes",
    "Subscripts",
    "Setter Observers"]

    var time = 0
    var vocabIndex = -1
    
    override func viewDidLoad() {
        next(self)
    }
    
    func countDown() {
        time -= 1
        if (time < 0) {
            time = 30
            vocabIndex = vocabIndex < vocab.count-1 ? vocabIndex+1 : 0
            vocabText.text = vocab[vocabIndex].uppercaseString
        }
        timeLabel.text = String(time)
    }
    
    func next(sender: AnyObject) {
        time = -999
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        next(self)
        return true
    }
}

