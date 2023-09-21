//
//  ViewController.swift
//  BansiDholakiya_MAPD714_Assign1
//
//  Created by Bansi Dholakiya on 2023-09-21.
//

import UIKit

class ViewController: UIViewController {
    
    // bind UI components
    @IBOutlet var principalTextField: UITextField!
    @IBOutlet var timeTextField: UITextField!
    @IBOutlet var roiTextField: UITextField!
    @IBOutlet var interestText: UILabel!
    @IBOutlet var totalAmountText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //onclick of caclulate button
    @IBAction func onCalculateClicked(_ sender: UIButton){
        calculatreInterest()
    }
    
    //onclick of clear button
    @IBAction func onClearClicked(_ sender: UIButton){
        clearFields()
    }
    
    //clear all text fields and set default values to label
    func clearFields(){
        principalTextField.text = "";
        timeTextField.text = "";
        roiTextField.text = "";
        interestText.text = "0"
        totalAmountText.text = "0"
    }
    
    //check textfield values and calculate simple interest
    func calculatreInterest(){
        if((principalTextField.text ?? "").isEmpty || (roiTextField.text ?? "").isEmpty || (timeTextField.text ?? "").isEmpty){
            return
        }else{
            let P = Int(principalTextField.text!) ?? 0
            let R = Int(roiTextField.text!) ?? 0
            let T = Int(timeTextField.text!) ?? 0
            let SI = (P * R * T)/100
            
            interestText.text = SI.description
            totalAmountText.text = (SI + P).description
        }
        
    }


}

