//
//  DiceRollerController.swift
//  CharacterCreator
//
//  Created by Michelle Stafford on 2019-04-07.
//  Copyright © 2019 Michelle Stafford. All rights reserved.
//

import Foundation
import UIKit

class DiceRollerController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate{
    @IBOutlet weak var TypeOfDice: UITextField!
    @IBOutlet weak var NumberOfDice: UITextField!
    @IBOutlet weak var Bonus: UITextField!
    @IBOutlet weak var RollDice: UIButton!
    @IBOutlet weak var ResultsTable: UITableView!
    @IBOutlet weak var AdvantageSwitch: UISwitch!
    @IBOutlet weak var DisadvantageSwitch: UISwitch!
    
    var diceRolledResults = [DiceRolledResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TypeOfDice.keyboardType = UIKeyboardType.numberPad
        TypeOfDice.delegate = self
        NumberOfDice.keyboardType = UIKeyboardType.numberPad
        NumberOfDice.delegate = self
        Bonus.keyboardType = UIKeyboardType.numberPad
        Bonus.delegate = self
        definesPresentationContext = true
        
        RollDice.addTarget(self, action: #selector(diceRoller), for: .touchUpInside)
    }
    
    @objc func diceRoller(sender: UIButton!){
        if(TypeOfDice.text!.isEmpty || NumberOfDice.text!.isEmpty){
            return
        }
        TypeOfDice.endEditing(true)
        NumberOfDice.endEditing(true)
        Bonus.endEditing(true)
        
        let diceType: Int = Int(TypeOfDice.text!)!
        let numberOfDice: Int = Int(NumberOfDice.text!)!
        let bonus: Int = Bonus.text!.isEmpty ? 0 : Int(Bonus.text!)!
        
        var result = 0
        var results = [Int]()
        
        if (diceType == 0){
            return
        }
        if(numberOfDice == 0){
            return
        }
        if(numberOfDice == 1){
            result = Int.random(in: 1...diceType)
            results.append(result)
        }
        else{
            for _ in 1...numberOfDice{
                result = Int.random(in: 1...diceType)
                results.append(result)
            }
        }
                
        let diceResult = DiceRolledResult()
        diceResult.setDiceRolledResult(diceType: diceType, diceRolled: results, bonus: bonus)
        if (diceRolledResults.count == 0){
            diceRolledResults.append(diceResult)
        }
        else{
            diceRolledResults.insert(diceResult, at: 0)
        }
        
        ResultsTable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diceRolledResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiceRolledResultCell", for: indexPath)           as! DiceResultCell
        let diceResult = diceRolledResults[indexPath.row]
        cell.setDiceDisplayResult(diceRolledResults: diceResult)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDiceRolledResultDetailsView" {
            if let indexPath = ResultsTable.indexPathForSelectedRow {
                let rolledResult: DiceRolledResult
                rolledResult = diceRolledResults[indexPath.row]
                
                let controller = (segue.destination as! DiceRolledResultDetailsView)
                controller.rolledResult = rolledResult
            }
        }
    }
}
