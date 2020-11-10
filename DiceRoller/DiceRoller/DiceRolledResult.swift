//
//  DiceRolledResult.swift
//  CharacterCreator
//
//  Created by Michelle Stafford on 2019-04-21.
//  Copyright © 2019 Michelle Stafford. All rights reserved.
//

import Foundation
import UIKit

class DiceRolledResult {
    var diceType = 0
    var diceRolled = [Int]()
    var bonus = 0
    var diceRolledResult = ""
    
    func setDiceRolledResult(diceType: Int, diceRolled: [Int], bonus: Int){
        self.diceType = diceType
        self.diceRolled = diceRolled
        self.bonus = bonus
        diceRolledResult = diceResult()
    }
    
    func diceResult () -> String {
        var displayResult = ""
        var total = 0
        for i in (1...diceRolled.count){
            if(displayResult.isEmpty){
                displayResult = "D" + String(diceType) + " (" + String(diceRolled[i-1]) + ") " + "+"
            }
            else if(i < diceRolled.count){
                displayResult += " (" + String(diceRolled[i-1]) + ") " + "+"
            }
            else{
                displayResult += " (" + String(diceRolled[i-1]) + ")"
            }
            
            total += diceRolled[i-1]
        }
        
        total += bonus
        displayResult += " bonus: " + String(bonus) + " total: " + String(total)
        
        return displayResult
    }
}
