//
//  ViewController.swift
//  FunColors
//
//  Created by Fernando Cardenas on 21/04/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import UIKit

var application:Application = Application()

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var numIte: Int = 0
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var selectedColorImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var numIterations: UILabel!
    
    
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

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Initialize Button Circles
        application.addButtonCirclesToList()
        timerLabel.text = "\(application.maxTimer)"
        scoreLabel.text = "\(application.score)"
        levelLabel.text = "\(application.level)"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.countUp), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func countUp(){
        if application.timer <= 0.1 {
            nextIteration()
        }
        else{
            application.decreaseTimer()
        }
        timerLabel.text = String(format: "%.1f", application.timer)

    }
    
    func nextIteration() {
        application.defineColorToSelection()
        application.assignNewColorsToArray()
        updateImageButtonCircles()
        
        numIte += 1
        numIterations.text = "\(numIte)"
        application.increaseLevel(numIte)
        application.changeNumberCirclesAndColors()
        levelLabel.text = "\(application.level)"
        
        let color = application.selectedColor
        selectedColorImage.image = UIImage(named: "\(color)")
        application.initTimer()
        
        
        
        
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
    
    


}

