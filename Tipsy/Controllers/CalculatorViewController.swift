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
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // Check to see what the button that triggered this IBAction is by checking the button's title text label
        if(sender.titleLabel?.text == "0%"){ // If it is 0%, show selected then deselect all other buttons
            zeroPercentButton.isSelected = true
            tenPercentButton.isSelected = false
            twentyPercentButton.isSelected = false
        }
        else if (sender.titleLabel?.text == "10%"){ // If it is 10%, show selected then deselect all other buttons
            zeroPercentButton.isSelected = false
            tenPercentButton.isSelected = true
            twentyPercentButton.isSelected = false
        }
        else{ // If it is 20%, show selected then deselect all other buttons
            zeroPercentButton.isSelected = false
            tenPercentButton.isSelected = false
            twentyPercentButton.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // Check to see which button is currently selected, there will only be one button selected at a time
        if(zeroPercentButton.isSelected){
            print("0.0")
        }
        else if(tenPercentButton.isSelected){
            print("0.1")
        }
        else{
            print("0.2")
        }
    }
    
}

