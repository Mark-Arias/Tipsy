//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var userPercentTipSelection = 0.0
    var userSelectedSplit = 0
    var userBillTotal = 0.0
    
    var calculatedTip = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billTextField.delegate = self
        
        if let splitNum = Int(splitNumberLabel.text!) {
            userSelectedSplit = splitNum
        }
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        if sender.titleLabel?.text == "0%" {
            userPercentTipSelection = 0.0
            
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if sender.titleLabel?.text == "10%" {
            userPercentTipSelection = 0.1
            
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else if sender.titleLabel?.text == "20%" {
            userPercentTipSelection = 0.2
            
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.minimumValue = 1
        sender.maximumValue = 6
        userSelectedSplit = Int(sender.value)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(userPercentTipSelection)
        print(userSelectedSplit)
        if let billTotal = Double(billTextField.text!) {
            userBillTotal = billTotal
        }
        print(userBillTotal)
        
        calculateTip()
        
        print("Calculated tip:")
        print(calculatedTip)
        
        billTextField.resignFirstResponder()
        
        // modally present resutlts vc
        // self.performSegue(withIdentifier: "goToResultsVC", sender: self)
        
    }
    
    func calculateTip() {
        calculatedTip = userBillTotal * userPercentTipSelection / Double(userSelectedSplit)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToResultsVC" {   // set what to prepare for based on id match
            // let destinationVC = segue.destination as! ResultsViewController
            // set the properties of the new vc here
        }
    }
    
    


}

