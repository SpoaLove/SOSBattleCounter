//
//  ViewController.swift
//  SOSBattleCounter
//
//  Created by Tengoku no Spoa on 2018/2/19.
//  Copyright © 2018年 Tengoku no Spoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shinyChanceLabel: UILabel!
    @IBOutlet weak var chainCountLabel: UILabel!
    @IBOutlet weak var leastPerfectIVsLabel: UILabel!
    @IBOutlet weak var hiddenAbillityLabel: UILabel!
    @IBOutlet weak var countStepCounter: UIStepper!
    
    var shinyCharm = false
    
    @IBAction func shinyCharmSwitch(_ sender: UISwitch) {
        shinyCharm = !shinyCharm
        refreshValues(with: Int(countStepCounter.value))
    }
    
    @IBAction func countStepCounterValueDidChanged(_ sender: UIStepper) {
        refreshValues(with: Int(sender.value))
    }
    
    @IBAction func resetButtonDidPressed(_ sender: UIButton) {
        countStepCounter.value = 0
        refreshValues(with: 0)
        
    }
    @IBAction func setButtonDidPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Reset Level", message: "New Level? (level = count of the string input)", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.text = "0"
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            if let textField = alert?.textFields![0] {
                self.countStepCounter.value = Double(textField.text!)!
                self.refreshValues(with: Int(self.countStepCounter.value))
            }
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    func refreshValues(with count:Int){
        chainCountLabel.text = count.description
        leastPerfectIVsLabel.text = loadLeastPerfectIVs(with: count)
        hiddenAbillityLabel.text = loadHiddenAbilityPercentage(with: count)
        shinyChanceLabel.text = loadShinyChance(with: count)
    }
    
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
    
    func loadShinyChance(with count:Int) -> String {
        if count <= 10 {
            return shinyCharm ? "≈1/1366" : "1/4096"
        } else if count >= 11 && count <= 20 {
            return shinyCharm ? "≈1/585" : "≈1/820"
        } else if count >= 21 && count <= 30 {
            return shinyCharm ? "≈1/455" : "≈1/373"
        } else {
            return  shinyCharm ? "≈1/315" : "≈1/273"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

