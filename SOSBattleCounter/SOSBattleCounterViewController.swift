//
//  ViewController.swift
//  SOSBattleCounter
//
//  Created by Tengoku no Spoa on 2018/2/19.
//  Copyright © 2018年 Tengoku no Spoa. All rights reserved.
//

import UIKit

class SOSBattleCounterViewController: UIViewController {

    
    /**
     * UILabels
     */
    @IBOutlet weak var shinyChanceLabel: UILabel!
    @IBOutlet weak var chainCountLabel: UILabel!
    @IBOutlet weak var leastPerfectIVsLabel: UILabel!
    @IBOutlet weak var hiddenAbillityLabel: UILabel!
    
    /**
     * Chain Count Counter
     */
    @IBOutlet weak var countStepCounter: UIStepper!
    
    var SOSBattleCounter = SOSBattleCounterModel()
    
    /**
     * This function will filp the shinyCharm boolean value and refresh the labels
     */
    @IBAction func shinyCharmSwitch(_ sender: UISwitch) {
        SOSBattleCounter.shinyCharm = !SOSBattleCounter.shinyCharm
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
        let alert = UIAlertController(title: "Set Chain Count", message: "Current Chain Count?", preferredStyle: .alert)
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
        leastPerfectIVsLabel.text = SOSBattleCounter.loadLeastPerfectIVs(with: count)
        hiddenAbillityLabel.text = SOSBattleCounter.loadHiddenAbilityPercentage(with: count)
        shinyChanceLabel.text = SOSBattleCounter.loadShinyChance(with: count)
    }
}

