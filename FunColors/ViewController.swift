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
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.countUp), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func countUp(){
        timerLabel.text = "\(application.timer)"
        if application.timer == 0 {
            let color = application.selectedColor
            selectedColorImage.image = UIImage(named: "\(color)")
            
            /*
            switch color {
            case .Blue:
                selectedColorImage.image = UIImage(named: "circle_blue")
                print(color.rawValue)
            case .Red:
                selectedColorImage.image = UIImage(named: "circle_red")
            case .Green:
                selectedColorImage.image = UIImage(named: "circle_green")
            case .Gold:
                selectedColorImage.image = UIImage(named: "circle_yellow")
                
            }
             */
            application.defineColorToSelection()
            application.assignNewColorsToArray()
            application.initTimer()
        }
        else{
            application.decreaseTimer()
        }
    }
    
    func updateImageButtonCircles(){
        //Check how to change button´s image
        /*circleButton0.UIImageView = UIImage(named: "\(application.circleButtonList[0].currentColor.rawValue)")
         */
    }
    
    


}

