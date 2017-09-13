//
//  ViewController.swift
//  calQMe
//
//  Created by isajisai on 9/12/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel?
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display!.text!
            display!.text = textCurrentlyInDisplay + digit
            return
        } else {
            if sender.currentTitle! == "0" {
                return
            }
            display!.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        if let symbol = sender.currentTitle {
            switch symbol {
            case "AC":
                display!.text = "0"
                userIsInTheMiddleOfTyping = false
            case "+/−":
                if display!.text![display!.text!.startIndex] == "-" {
                    display!.text!.remove(at: display!.text!.startIndex)
                    break
                }
                display!.text!.insert("-", at: display!.text!.startIndex)
            case "*2":
                display!.text = String(Double(display!.text!)! * 2)
            case "*16":
                display!.text = String(Double(display!.text!)! * 16)
            case "/2":
                display!.text = String(Double(display!.text!)! / 2)
            case "/16":
                display!.text = String(Double(display!.text!)! / 16)
            case "^2":
                display!.text = String(pow(Double(display!.text!)!, 2))
            case "^16":
                display!.text = String(pow(Double(display!.text!)!, 16))
            case "√":
                display!.text = String(sqrt(Double(display!.text!)!))
            case "16√":
                display!.text = String(pow(Double(display!.text!)!, 1/16))
            default:
                break
            }
        }
        
    }
    
    
}

