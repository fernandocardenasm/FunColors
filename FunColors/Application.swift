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
    let maxTimer: Double
    var level: Int
    var numCirclesChanges: Int
    
    init(){
        score = 0
        selectedColor = .Blue
        circleButtonList = []
        availableColors = [.Red, .Blue]
        timer = 1.6 //Assign 0.1 more than the desired one
        maxTimer = 1.6
        level = 1
        numCirclesChanges = 3
    }
    
    func resetClassValues(){
        score = 0
        selectedColor = .Blue
        circleButtonList = []
        availableColors = [.Red, .Blue]
        timer = 1.6 //Assign 0.1 more than the desired one
        level = 1
        numCirclesChanges = 3
    }
    
    func addButtonCirclesToList(){
        for i in 0...8{
            self.circleButtonList.append(ButtonCircle(id: i, currentColor: .Blue))
        }
    }
    
    //Return the aray of the button circles that should be changed
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
    
    //Validates that the random numer is not already in the array
    func uniquenessOfRandomForColorsToChange(array: [Int], number: Int) -> Bool{
        
        for index in 0...array.count - 1 {
            if array[index] == number {
                return false
            }
        }
        return true
    }
    
    //Assign new color to Array List of Button Circles
    func assignNewColorsToArray() {
        var array: [ButtonCircle] = arrayColorsToChange()
        unassignGoldToButtonCircles()
        for index in 0...array.count - 1 {
            self.circleButtonList[array[index].id].currentColor = getRandomColorButtonCircle(array[index])
        }
        assureSelectedColorInCurrents()
        
    }
    
    //Make sure that exists at least one current color with the Application selected color
    func assureSelectedColorInCurrents() {
        var sw: Bool = true
        var cont = 0
        while cont < self.circleButtonList.count && sw {
            if self.circleButtonList[cont].currentColor == self.selectedColor {
                sw = false
            }
            cont += 1
        }
        if sw == true {
            let randomColorNumber = Int(arc4random_uniform(UInt32(self.circleButtonList.count)))
            self.circleButtonList[randomColorNumber].currentColor = self.selectedColor
        }
    }
    
    //Get random color to be used in the tap Buttons
    func getRandomColorButtonCircle(circle: ButtonCircle) -> ColorSelection {
        var randomColorNumber: Int
        var color: ColorSelection
        repeat {
            randomColorNumber = Int(arc4random_uniform(UInt32(self.availableColors.count)))
            color = self.availableColors[randomColorNumber]
        }while color == circle.currentColor
        
        return color
    }
    
    //Unassign the color Gold for the Button Circles
    func unassignGoldToButtonCircles(){
        var randomColorNumber: Int
        var color: ColorSelection
        for index in 0...self.circleButtonList.count - 1 {
            if self.circleButtonList[index].currentColor == .Gold {
                randomColorNumber = Int(arc4random_uniform(UInt32(self.availableColors.count)))
                color = self.availableColors[randomColorNumber]
                self.circleButtonList[index].currentColor = color
            }
        }
    }
    
    //Get the random color that will be used in the selection Circle
    func defineColorToSelection(){
        if useGoldenColor() {
            self.selectedColor =  .Gold
        }
        else{
            let randomColorNumber: Int = Int(arc4random_uniform(UInt32(self.availableColors.count)))
            self.selectedColor = self.availableColors[randomColorNumber]
        }
    }
    
    //Validates the amount of points that the score will be increased
    func increaseScore(color: ColorSelection) {
        if color == .Gold {
            self.score += 20 * self.level
        }
        else{
            self.score += 10 * self.level
        }
    }
    
    //Increase Level
    func increaseLevel(numIteration: Int){
        switch numIteration {
        case 10:
            self.level += 1
        case 20:
            self.level += 1
        case 30:
            self.level += 1
        case 40:
            self.level += 1
        case 50:
            self.level += 1
        case 60:
            self.level += 1
        default:
            break
        }
    }
    
    //Change the number of color that will be changed and the number of colors that will be used
    func changeNumberCirclesAndColors(){
        switch self.level {
        case 1:
            self.numCirclesChanges = 3
            self.availableColors = [.Red, .Blue]
        case 2:
            self.numCirclesChanges = 4
            self.availableColors = [.Red, .Blue]
        case 3:
            self.numCirclesChanges = 5
            self.availableColors = [.Red, .Blue]
        case 4:
            self.numCirclesChanges = 3
            self.availableColors = [.Red, .Blue, .Green]
        case 5:
            self.numCirclesChanges = 4
            self.availableColors = [.Red, .Blue, .Green]
        case 6:
            self.numCirclesChanges = 5
            self.availableColors = [.Red, .Blue, .Green]
        case 7:
            self.numCirclesChanges = 6
            self.availableColors = [.Red, .Blue, .Green]
        default:
            break
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
        self.timer -= 0.1
    }
    
    func initTimer() {
        self.timer = self.maxTimer
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
}

