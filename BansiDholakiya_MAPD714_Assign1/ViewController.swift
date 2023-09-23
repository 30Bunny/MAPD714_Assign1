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
    @IBOutlet var textFieldView: UIView!
    @IBOutlet var resultView: UIView!
    @IBOutlet var roundView: UIView!
    @IBOutlet var lineView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        styleCard(view: resultView)
        styleCard(view: textFieldView)
        styleRoundCard(view: roundView)
        styleSeprator(view: lineView)
    }
    
    //style rectangular cards
    func styleCard(view: UIView){
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view.layer.shadowRadius = 8.0
        view.layer.shadowOpacity = 0.5
    }
    
    //style circle shap cards
    func styleRoundCard(view: UIView){
        view.layer.cornerRadius = view.frame.width / 2
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 4.0
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
    }
    
    //style seprator view
    func styleSeprator(view: UIView){
        view.frame.size.height = 1
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
        interestText.text = "$ 0"
        totalAmountText.text = "$ 0"
    }
    
    //calculate simple interest
    func calculatreInterest(){
        if(isValidInput()){
            let P = Double(principalTextField.text!) ?? 0.0
            let R = Double(roiTextField.text!) ?? 0.0
            let T = Double(timeTextField.text!) ?? 0.0
            let SI = (P * R * T)/100

            interestText.text = "$ \(SI.description)"
            totalAmountText.text = "$ \((SI + P).description)"
        }

    }
    
    //check inputs are valid or not
    func isValidInput() -> Bool{
        if((principalTextField.text ?? "").isEmpty || (roiTextField.text ?? "").isEmpty || (timeTextField.text ?? "").isEmpty){
            displayAlert(message: "Please enter required input")
            return false
        }else if(!principalTextField.text!.isDouble()){
            displayAlert(message: "Please enter valid principal")
            return false
        }else if(!timeTextField.text!.isDouble()){
            displayAlert(message: "Please enter valid time period")
            return false
        }else if(!roiTextField.text!.isDouble()){
            displayAlert(message: "Please enter valid rate of interest")
            return false
        }
        return true;
    }
    
    //display alert message
    func displayAlert(message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel))
        present(alert, animated: true)
    }

}


extension String {
    func isDouble() -> Bool {

        if Double(self) != nil {
            return true
        }

        return false
    }
}
