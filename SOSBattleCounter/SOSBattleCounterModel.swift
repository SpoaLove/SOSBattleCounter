//
//  SOSBattleCounterModel.swift
//  SOSBattleCounter
//
//  Created by Tengoku no Spoa on 2018/2/20.
//  Copyright © 2018年 Tengoku no Spoa. All rights reserved.
//

import Foundation

class SOSBattleCounterModel {

    /**
     * This boolean value will effect the percentage of shiny chance
     */
    var shinyCharm = false
    
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
