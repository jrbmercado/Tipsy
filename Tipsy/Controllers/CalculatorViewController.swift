//
//  ViewController.swift
//  Tipsy
//
//  Created by Justin Mercado on 08/28/2022

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipToApply = 0.0 // Keeps track of the decimal number we need to apply for tip calculation based on which percentage is selected
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // Check to see what the button that triggered this IBAction is by checking the button's title text label
        if(sender.titleLabel?.text == "0%"){ // If it is 0%, show selected then deselect all other buttons and update tipToApply value
            tipToApply = 0.0
            zeroPercentButton.isSelected = true
            tenPercentButton.isSelected = false
            twentyPercentButton.isSelected = false
        }
        else if (sender.titleLabel?.text == "10%"){ // If it is 10%, show selected then deselect all other buttons and update tipToApply value
            tipToApply = 0.1
            zeroPercentButton.isSelected = false
            tenPercentButton.isSelected = true
            twentyPercentButton.isSelected = false
        }
        else{ // If it is 20%, show selected then deselect all other buttons and update tipToApply value
            tipToApply = 0.2
            zeroPercentButton.isSelected = false
            tenPercentButton.isSelected = false
            twentyPercentButton.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(tipToApply)
        print(splitNumberLabel.text ?? 2)
    }
    
}

