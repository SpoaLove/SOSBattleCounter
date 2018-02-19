//
//  ViewController.swift
//  SOSBattleCounter
//
//  Created by Tengoku no Spoa on 2018/2/19.
//  Copyright © 2018年 Tengoku no Spoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    /**
     * Labels
     */
    @IBOutlet weak var shinyChanceLabel: UILabel!
    @IBOutlet weak var chainCountLabel: UILabel!
    @IBOutlet weak var leastPerfectIVsLabel: UILabel!
    @IBOutlet weak var hiddenAbillityLabel: UILabel!
    
    /**
     * SOS Counter
     */
    @IBOutlet weak var countStepCounter: UIStepper!
    
    /**
     * This boolean value will effect the percentage of shiny chance
     */
    var shinyCharm = false
    
    /**
     * This function will filp the shinyCharm boolean value and refresh the labels
     */
    @IBAction func shinyCharmSwitch(_ sender: UISwitch) {
        shinyCharm = !shinyCharm
        refreshValues(with: Int(countStepCounter.value))
    }
    
    /**
     * This function will refresh the labels whenever the step counter value have changed
     */
    @IBAction func countStepCounterValueDidChanged(_ sender: UIStepper) {
        refreshValues(with: Int(sender.value))
    }
    
    /**
     * This function will set the countStepCounter back to 0 and refresh the labels
     */
    @IBAction func resetButtonDidPressed(_ sender: UIButton) {
        countStepCounter.value = 0
        refreshValues(with: 0)
        
    }
    
    /**
     * This function will set the countStepCounter to a user inputed value using UIAlertController
     */
    @IBAction func setButtonDidPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Reset Level", message: "New Level? (level = count of the string input)", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = "0" // default text = 0
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            if let textField = alert?.textFields![0] {
                self.countStepCounter.value = Double(textField.text!)!
                self.refreshValues(with: Int(self.countStepCounter.value))
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    /**
     * This function refreshes the text of the labels according to a inputed count
     *
     * @param count an inputed interger that defines the current chain count
     */
    func refreshValues(with count:Int){
        chainCountLabel.text = count.description
        leastPerfectIVsLabel.text = loadLeastPerfectIVs(with: count)
        hiddenAbillityLabel.text = loadHiddenAbilityPercentage(with: count)
        shinyChanceLabel.text = loadShinyChance(with: count)
    }
    
    /**
     * This function takes an inputed chain count and output a formnated String of the corresponding Least Perfect IVs
     *
     * @param count an inputed interger that defines the current chain count
     *
     * @return a formated String of the corresponding Least Perfect IVs
     */
    func loadLeastPerfectIVs(with count:Int) -> String {
        if count <= 4 {
            return "0"
        } else if count >= 5 && count <= 9 {
            return "1"
        } else if count >= 10 && count <= 19 {
            return "2"
        } else if count >= 20 && count <= 29 {
            return "3"
        } else {
            return "4"
        }
        
    }
    
    /**
     * This function takes an inputed chain count and output a formnated String of the corresponding Hidden Ability Percentage
     *
     * @param count an inputed interger that defines the current chain count
     *
     * @return a formated String of the corresponding Hidden Ability Percentage
     */
    func loadHiddenAbilityPercentage(with count:Int) -> String {
        if count <= 9 {
            return "0%"
        } else if count >= 10 && count <= 19 {
            return "5%"
        } else if count >= 20 && count <= 29 {
            return "10%"
        } else {
            return "15%"
        }
    }
    
    /**
     * This function takes an inputed chain count and output a formnated String of the corresponding Shiny Chance
     *
     * @param count an inputed interger that defines the current chain count
     *
     * @return a formated String of the corresponding Shiny Chance
     */
    func loadShinyChance(with count:Int) -> String {
        if count <= 10 {
            return shinyCharm ? "≈1/1366" : "1/4096"
        } else if count >= 11 && count <= 20 {
            return shinyCharm ? "≈1/585" : "≈1/820"
        } else if count >= 21 && count <= 30 {
            return shinyCharm ? "≈1/373" : "≈1/455"
        } else {
            return  shinyCharm ? "≈1/273" : "≈1/315"
        }
    }
}

