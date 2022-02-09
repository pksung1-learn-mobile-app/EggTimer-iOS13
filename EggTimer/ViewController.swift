//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerProgress: UIProgressView!
    
    
    let eggTimes: [String: Int] = [
        "Soft" : 5 * 60,
        "Medium" : 7 * 60,
        "Hard": 12 * 60
    ]
    
    var currentTime: Int = 0
    var startTime: Int = 0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        timerLabel.text = "0"
    }
    


    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        currentTime = eggTimes[hardness] ?? 0
        startTime = eggTimes[hardness] ?? 0
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(downTime), userInfo: nil, repeats: true)
        
//        if hardness == "Soft" {
//            print(softTime)
//        } else if hardness == "Medium" {
//            print(mediumTime)
//        } else {
//            print(hardTime)
//        }
        
//        switch hardness {
//        case "Soft":
//            print (softTime)
//        case "Medium":
//            print(hardTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("Error")
//        }
        print(eggTimes[hardness])
    }
    
    @objc func downTime () {
        currentTime = currentTime - 1
        timerLabel.text = String(currentTime)
        if startTime != 0 {
            timerProgress.progress = Float(startTime - currentTime) / Float(startTime)
            
        }
        if currentTime == 0 {
            timer.invalidate()
        }
    }
}
