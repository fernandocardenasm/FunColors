//
//  ViewController.swift
//  FunColors
//
//  Created by Fernando Cardenas on 21/04/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import UIKit
import JSSAlertView

var application:Application = Application()

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var numIte: Int = 0
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var selectedColorImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    
    @IBOutlet weak var circleButton0: UIButton!
    @IBOutlet weak var circleButton1: UIButton!
    @IBOutlet weak var circleButton2: UIButton!
    @IBOutlet weak var circleButton3: UIButton!
    @IBOutlet weak var circleButton4: UIButton!
    @IBOutlet weak var circleButton5: UIButton!
    @IBOutlet weak var circleButton6: UIButton!
    @IBOutlet weak var circleButton7: UIButton!
    @IBOutlet weak var circleButton8: UIButton!
    
    
    
    @IBAction func circleButtonWasTapped(sender: UIButton) {
        if application.circleButtonList[sender.tag].currentColor == application.selectedColor{
            application.increaseScore(application.selectedColor)
            scoreLabel.text = "\(application.score)"
            nextIteration()
            timerLabel.text = String(format: "%.1f", application.timer)
        }
        else {
            loseTheGame()
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Initialize Button Circles
        
        setValuesToLabels()
        
        let alertview = JSSAlertView().show(self,
                                            title: "Let´s start Playing!"
        )
        alertview.addAction(startGameCallback) // Method to run after dismissal
        alertview.setTitleFont("ClearSans-Bold") // Title font
        alertview.setTextFont("ClearSans") // Alert body text font
        alertview.setButtonFont("ClearSans-Light") // Button text font
        alertview.setTextTheme(.Dark) // can be .Light or .Dark
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func countUp(){
        if application.timer <= 0.1 {
            //nextIteration()
            loseTheGame()
        }
        else{
            application.decreaseTimer()
        }
        timerLabel.text = String(format: "%.1f", application.timer)

    }
    
    //Defines what need to be done when a new iteration happens
    func nextIteration() {
        application.defineColorToSelection()
        application.assignNewColorsToArray()
        updateImageButtonCircles()
        
        numIte += 1
        application.increaseLevel(numIte)
        application.changeNumberCirclesAndColors()
        levelLabel.text = "\(application.level)"
        
        updateSelectedColor()
        application.initTimer()
        
    }
    
    func loseTheGame(){
        timer.invalidate()
        numIte = 0
        let alertview = JSSAlertView().show(self,
                                            title: "Your Score was: \(application.score)! Let´s play Again."
        )
        alertview.addAction(startGameCallback) // Method to run after dismissal
        alertview.setTitleFont("ClearSans-Bold") // Title font
        alertview.setTextFont("ClearSans") // Alert body text font
        alertview.setButtonFont("ClearSans-Light") // Button text font
        alertview.setTextTheme(.Dark) // can be .Light or .Dark
    }
    
    func startGameCallback() {
        // this'll run after the alert is dismissed
        resetValuesGame()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.countUp), userInfo: nil, repeats: true)
        
    }
    
    func resetValuesGame(){
        application.resetClassValues()
        application.addButtonCirclesToList()
        setValuesToLabels()
        updateImageButtonCircles()
        updateSelectedColor()
    }
    
    func setValuesToLabels(){
        timerLabel.text = "\(application.maxTimer)"
        scoreLabel.text = "\(application.score)"
        levelLabel.text = "\(application.level)"
    }
    
    func updateImageButtonCircles(){
        //Check how to change button´s image
        circleButton0.setImage(UIImage(named: "\(application.circleButtonList[0].currentColor.rawValue)"), forState: .Normal)
        circleButton1.setImage(UIImage(named: "\(application.circleButtonList[1].currentColor.rawValue)"), forState: .Normal)
        circleButton2.setImage(UIImage(named: "\(application.circleButtonList[2].currentColor.rawValue)"), forState: .Normal)
        circleButton3.setImage(UIImage(named: "\(application.circleButtonList[3].currentColor.rawValue)"), forState: .Normal)
        circleButton4.setImage(UIImage(named: "\(application.circleButtonList[4].currentColor.rawValue)"), forState: .Normal)
        circleButton5.setImage(UIImage(named: "\(application.circleButtonList[5].currentColor.rawValue)"), forState: .Normal)
        circleButton6.setImage(UIImage(named: "\(application.circleButtonList[6].currentColor.rawValue)"), forState: .Normal)
        circleButton7.setImage(UIImage(named: "\(application.circleButtonList[7].currentColor.rawValue)"), forState: .Normal)
        circleButton8.setImage(UIImage(named: "\(application.circleButtonList[8].currentColor.rawValue)"), forState: .Normal)
        
    }
    
    func updateSelectedColor(){
        let color = application.selectedColor
        selectedColorImage.image = UIImage(named: "\(color)")
    }
    

}

