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
    
    var totalBillCost = 0.0
    var tipToApply = 0.0 // Keeps track of the decimal number we need to apply for tip calculation based on which percentage is selected
    var totalCalculatedResult = 0.0
    var totalPeople = 2
    var selectedPercentage = ""
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // Check to see what the button that triggered this IBAction is by checking the button's title text label
        if(sender.titleLabel?.text == "0%"){ // If it is 0%
            tipToApply = 1.0 // Update tip value
            
            selectedPercentage = "0%"
            
            // Update selection UI
            zeroPercentButton.isSelected = true
            tenPercentButton.isSelected = false
            twentyPercentButton.isSelected = false
        }
        else if (sender.titleLabel?.text == "10%"){ // If it is 10%
            tipToApply = 1.1 // Update tip value
            
            selectedPercentage = "10%"
            
            // Update selection UI
            zeroPercentButton.isSelected = false
            tenPercentButton.isSelected = true
            twentyPercentButton.isSelected = false
        }
        else{ // If it is 20%
            tipToApply = 1.2 // Update tip value
            
            selectedPercentage = "20%"
            
            // Update selection UI
            zeroPercentButton.isSelected = false
            tenPercentButton.isSelected = false
            twentyPercentButton.isSelected = true
        }
        billTextField.endEditing(true) // Dismiss keyboard
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // Check to see if a bill amount has been entered
        if(billTextField.text == ""){ // If no bill total is entered yet, assume bill is $0
            totalBillCost = 0.0
        }
        else{ // Otherwise, grab the value
            totalBillCost = Double(billTextField.text!)!
        }
        
        // Grab the total number of people from the counter stepper
        totalPeople = Int(splitNumberLabel.text!)!
        
        // Calculate the total cost with tip included
        let totalCostWithTip = totalBillCost*tipToApply
        let splitCostWithTip = totalCostWithTip/Double(totalPeople)
        totalCalculatedResult = Double(String.init(format: "%.2f", splitCostWithTip))!
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalPerPersonNumber = totalCalculatedResult
            destinationVC.totalPeople = totalPeople
            destinationVC.selectedPercentage = selectedPercentage
        }
    }
}

