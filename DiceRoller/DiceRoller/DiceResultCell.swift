//
//  DiceResult.swift
//  CharacterCreator
//
//  Created by Michelle Stafford on 2019-04-21.
//  Copyright © 2019 Michelle Stafford. All rights reserved.
//

import Foundation
import UIKit

class DiceResultCell: UITableViewCell {
    @IBOutlet weak var diceRolledResult: UILabel!
    
    var diceType = 0
    var diceRolled = [Int]()
    var bonus = 0
    
    func setDiceDisplayResult(diceRolledResults: DiceRolledResult){
        diceType = diceRolledResults.diceType
        diceRolled = diceRolledResults.diceRolled
        bonus = diceRolledResults.bonus
        diceRolledResult.text = diceRolledResults.diceRolledResult
    }
}
