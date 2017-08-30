//
//  ViewController.swift
//  calcMe
//
//  Created by user on 8/29/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let textCurrentlyInDisplay = display.text!
        if display.text! == "0" {
            display.text! = digit
            return
        }
        display.text! = textCurrentlyInDisplay + digit
    }
    
    @IBAction func touchAction(_ sender: UIButton) {
        if let currentSymbol = sender.currentTitle{
            switch currentSymbol {
                case "AC":
                    display.text! = "0"
                case "⁺∕₋":
                    if display.text![display.text!.startIndex] != "-" {
                        display.text! = "-" + display.text!
                    } else {
                        display.text!.characters.removeFirst()
                    }
                case "π":
                    display.text! = String(Double.pi)
                case "e":
                    display.text! = String(M_E)
                case "φ":
                    display.text! = String(1.61803398874989)
                default:
                    break
            }
        }
        
    }

}

