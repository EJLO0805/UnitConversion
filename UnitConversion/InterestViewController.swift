//
//  InterestViewController.swift
//  UnitConversion
//
//  Created by 羅以捷 on 2022/8/30.
//

import UIKit

class InterestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showResult.layer.masksToBounds = true
        showResult.layer.cornerRadius = 20
        showResult.text = "請輸入預計存入金額以及時間\n並且輸入利率"

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var showResult: UILabel!
    
    @IBOutlet weak var cashTextField: UITextField!
    
    @IBOutlet weak var rateTextField: UITextField!
    
    @IBOutlet weak var monthTextField: UITextField!
    
    @IBOutlet weak var monthStepper: UIStepper!
    
    @IBAction func monthStepperValue(_ sender: UIStepper) {
        monthTextField.text = Calculator().numberFormatter(0).string(for: sender.value)
    }
    @IBAction func typeMonth(_ sender: UITextField) {
        let monthText = Double(monthTextField.text!)
        if let monthText = monthText {
            monthStepper.value = monthText > 0 ? monthText : 0
        }
    }
    @IBAction func calculate(_ sender: Any) {
        let interestCalculator = Calculator()
        let month = monthStepper.value
        let cash = Decimal(string: cashTextField.text!)
        let rate = Decimal(string: rateTextField.text!)
        var totalMoney : Decimal = 0
        if let cash = cash, let rate = rate, month > 0 {
            totalMoney = interestCalculator.depositInterestCalculate(cash, rate, month)
            showResult.text = "您的本金為 \(cash)、年利率為 \(rate) %\n期數為 \(Calculator().numberFormatter(0).string(for: month)!)期\n您的本利和為 \(Calculator().numberFormatter(0).string(for: totalMoney)!) 元"
        } else {
            showResult.text = "請輸入正確資訊"
        }
        view.endEditing(true)
    }
    
    @IBAction func clearAll(_ sender: Any) {
        monthStepper.value = 0
        showResult.text = "請輸入預計存入金額以及時間\n並且輸入利率"
        monthTextField.text = "0"
        rateTextField.text = ""
        cashTextField.text = ""
        
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
