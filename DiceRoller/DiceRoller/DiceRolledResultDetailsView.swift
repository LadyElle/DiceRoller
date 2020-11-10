//
//  DiceRolledResultDetailsView.swift
//  CharacterCreator
//
//  Created by Michelle Stafford on 2019-05-04.
//  Copyright © 2019 Michelle Stafford. All rights reserved.
//

import UIKit

class DiceRolledResultDetailsView: UIViewController {
    @IBOutlet weak var DiceRolledResultsText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayDiceRolledResult()
    }
    
    var rolledResult: DiceRolledResult?{
        didSet{
            displayDiceRolledResult()
        }
    }
    
    func displayDiceRolledResult(){
        if let diceRolledResult = rolledResult{
            if let rolledResultsText = DiceRolledResultsText {
                rolledResultsText.text = diceRolledResult.diceRolledResult
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillAppear(animated)
    }
}
