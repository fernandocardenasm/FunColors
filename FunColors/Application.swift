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
    
    func addButtonCirclesToList(){
        for i in 0...9{
            self.circleButtonList.append(ButtonCircle(id: i, currentColor: .Blue, lastColor: nil))
        }
    }
    
    //Return the position of the button circles that should be changed
    func arrayColorsToChange()->[ButtonCircle]{
        var randomNumber: Int
        var numbersArray: [Int] = []
        var arrayColorsToChange: [ButtonCircle] = []
        var cont = 1
        
        randomNumber = Int(arc4random_uniform(UInt32(self.circleButtonList.count)))
        numbersArray.append(randomNumber)

        while cont < self.numCirclesChanges {
            randomNumber = Int(arc4random_uniform(UInt32(self.circleButtonList.count)))
            if uniquenessOfRandomForColorsToChange(numbersArray, number: randomNumber){
                numbersArray.append(randomNumber)
                cont += 1
            }
        }
        
        for index in 0...numbersArray.count - 1 {
            arrayColorsToChange.append(self.circleButtonList[numbersArray[index]])
        }
        
        return arrayColorsToChange
        
    }
    
    
    func uniquenessOfRandomForColorsToChange(array: [Int], number: Int) -> Bool{
        
        for index in 0...array.count - 1 {
            if array[index] == number {
                return false
            }
        }
        return true
    }
    
    //Get the random color that will be used in the selection Circle
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
    
    //Validates if we must use the golden color for the selection Circle. 10% Chance to use it.
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
    
    //For Timer
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

