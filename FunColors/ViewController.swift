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
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var selectedColorImage: UIImageView!
    
    @IBOutlet weak var circleButton0: UIButton!
    @IBOutlet weak var circleButton1: UIButton!
    @IBOutlet weak var circleButton2: UIButton!
    @IBOutlet weak var circleButton3: UIButton!
    @IBOutlet weak var circleButton4: UIButton!
    @IBOutlet weak var circleButton5: UIButton!
    @IBOutlet weak var circleButton6: UIButton!
    @IBOutlet weak var circleButton7: UIButton!
    @IBOutlet weak var circleButton8: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Initialize Button Circles
        application.addButtonCirclesToList()
        
        application.arrayColorsToChange()
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.countUp), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func countUp(){
        timerLabel.text = "\(application.timer)"
        if application.timer <= 0 {
            application.defineColorToSelection()
            application.assignNewColorsToArray()
            updateImageButtonCircles()
            let color = application.selectedColor
            selectedColorImage.image = UIImage(named: "\(color)")

            application.initTimer()
        }
        else{
            application.decreaseTimer()
        }
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

