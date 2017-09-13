//
//  CalculatorBrain.swift
//  calcMe
//
//  Created by user on 9/12/17.
//  Copyright © 2017 user. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    mutating func performOperation(_ symbol: String) {
        switch symbol {
            case "AC":
                accumulator = 0
            case "π":
                accumulator = Double.pi
            case "e":
                accumulator = M_E
            case "φ":
                accumulator = 1.61803398874989
            default:
                break
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
}
