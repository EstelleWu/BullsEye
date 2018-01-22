//
//  ViewController.swift
//  Bullseye
//
//  Created by Estelle qiyu on 2017-02-23.
//  Copyright © 2017 Estelle qiyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    
    //keep track of value
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var targetLable: UILabel!
    
    @IBAction func startOver(_ sender: Any) {
        startNewGame()
        updateLabels()
    }
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
        //showAlert(sender) // print the current value
        
    }
    @IBAction func showAlert(_ sender: Any) {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        //goal: alert controller to print out difference
        //a
        let title: String
        
        if difference == 0{
            title = "Perfect!"
            points += 100
        }else if difference < 5{
            title = "You almost had it!"
            if difference == 1{
                points += 50
            }
        }else if difference < 10{
            title = "Pretty good"
        }else{
            title = "Not even close..."
        }
        //b
        let message = "The value of the slide is \(currentValue)\n The target value is \(targetValue)\n  You score \(points) points"
        score += points
        //c
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //items are concerned, need a OK button
        //handler -> trailing closure
        //retaining cycle
        let actionItem = UIAlertAction(title: "OK", style: .default){ [weak self]   //capture self; weak, self turns into basically an optional
            action in
            self?.startNewRound()
            self?.updateLabels()
            
        }
        alertController.addAction(actionItem)
        present(alertController, animated: true, completion: nil)
        
        //startNewRound()
        //updateLabels()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
        
        //slider
        let thumbImageNormal = UIImage(named: "sliderThumb-normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "sliderThumb-highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        //to add spacing
        /*
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "leftOfThumb")!
        let trackLeftSize = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftSize, for: .normal)
        
        let trackRightImage = UIImage(named: "rightOfThumb")!
        let trackRightSize = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightSize, for: .normal)
 */


        
        // Do any additional setup after loading the view, typically from a nib.  
        // on lifecycle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    
    func updateLabels(){
        targetLable.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int(arc4random_uniform(100)) + 1
        currentValue = 50
        slider.value = Float(currentValue)
    }


}

