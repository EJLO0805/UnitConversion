//
//  BMIViewController.swift
//  UnitConversion
//
//  Created by 羅以捷 on 2022/8/30.
//

import UIKit

class BMIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showBMIResult.layer.masksToBounds = true
        showBMIResult.layer.cornerRadius = 30
        showBMIResult.text = "請輸您的身高體重"

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var showBMIResult: UILabel!
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBAction func calculateBMI(_ sender: Any) {
        let numberformatter = Calculator().numberFormatter(2)
        let height = Double(heightTextField.text!)
        let weight = Double(weightTextField.text!)
        let calculatorForBMI = Calculator()
        if let height = height, let weight = weight {
            let bmi = calculatorForBMI.bmiFunction(height, weight)
            showBMIResult.text = "你的BMI\n\(numberformatter.string(for: bmi)!)\n\(calculatorForBMI.bmiStandard(bmi))"
        } else {
            showBMIResult.text = "請輸入數字"
        }
        view.endEditing(true)
    }
    
    @IBAction func restartAll(_ sender: Any) {
        heightTextField.text = ""
        weightTextField.text = ""
        showBMIResult.text = "請輸您的身高體重"
    }
    @IBAction func closeKeyBoard(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
