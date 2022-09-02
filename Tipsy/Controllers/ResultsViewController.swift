//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Justin Mercado on 8/28/22.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalPerPersonNumber = 0.0
    var totalPeople = 2
    var selectedPercentage = ""
    
    override func viewDidLoad() {
        totalLabel.text = String(totalPerPersonNumber)
        let message = "Split between \(totalPeople) people, with \(selectedPercentage) tip."
        settingsLabel.text = message
        super.viewDidLoad()
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
