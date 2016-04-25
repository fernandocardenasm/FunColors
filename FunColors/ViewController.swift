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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.countUp), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func countUp(){
        timerLabel.text = "\(application.timer)"
        if application.timer == 0 {
            let color = application.getRandomColor()
            switch color {
            case .Blue:
                selectedColorImage.image = UIImage(named: "circle_blue")
            case .Red:
                selectedColorImage.image = UIImage(named: "circle_red")
            case .Green:
                selectedColorImage.image = UIImage(named: "circle_green")
            case .Gold:
                selectedColorImage.image = UIImage(named: "circle_yellow")
                
            }
            application.initTimer()
        }
        else{
            application.decreaseTimer()
        }
    }
    
    


}

