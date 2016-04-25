//
//  Application.swift
//  FunColors
//
//  Created by Fernando Cardenas on 25/04/16.
//  Copyright © 2016 Fernando. All rights reserved.
//

import Foundation

class Application {
    var score: Int
    var selectedColor: ColorSelection
    var circleButtonList: [ButtonCircle]
    var availableColors: [ColorSelection]
    var timer: Double
    var level: Int
    var numCirclesChanges: Int
    var numColorsToUse: Int
    
    init(){
        score = 0
        selectedColor = .Blue
        circleButtonList = []
        availableColors = [.Blue, .Red]
        timer = 3.0
        level = 1
        numCirclesChanges = 3
        numColorsToUse = 2
    }
    
    func allButtonCircles()->[ButtonCircle]{
        var circleButtons: [ButtonCircle] = []
        for i in 0...9{
            circleButtons.append(ButtonCircle(id: i, currentColor: .Blue, lastColor: nil))
        }
        return circleButtons
    }
    
    func getRandomColor()->ColorSelection{
        if useGoldenColor() {
            return .Gold
        }
        else{
            let randomColorNumber: Int = Int(arc4random_uniform(UInt32(self.availableColors.count)))
            print(randomColorNumber)
            return self.availableColors[randomColorNumber]
        }
    }
    
    func useGoldenColor()->Bool{
        //Max Number: 9, to achieve a 10% chances to get 0, from 0 to 9.
        let randomNumber:Int = Int(arc4random_uniform(UInt32(10)))
        if randomNumber == 0 {
            return true
        }
        else {
            return false
        }
    }
    
    func decreaseTimer() {
        self.timer -= 1
    }
    
    func initTimer() {
        self.timer = 3
    }
    
}

enum ColorSelection: String {
    case Red
    case Blue
    case Green
    case Gold
}

struct ButtonCircle {
    let id: Int
    var currentColor:ColorSelection
    var lastColor: ColorSelection?
}

