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
        if application.timer == 0 {
            let color = application.getRandomColor()
            print("Raw:",color.rawValue)
            application.initTimer()
        }
        else{
            application.decreaseTimer()
        }
    }
    
    


}

