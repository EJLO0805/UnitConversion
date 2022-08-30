//
//  TemperatureViewController.swift
//  UnitConversion
//
//  Created by 羅以捷 on 2022/8/30.
//

import UIKit

class TemperatureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var celsiusTempTextField: UITextField!
    
    @IBOutlet weak var fahrenheitTempTextField: UITextField!
    
    @IBOutlet weak var kelvinTempTextField: UITextField!
    
    @IBAction func temperatureChange(_ sender: UITextField) {
        let celsiusTempText = Double(celsiusTempTextField.text!)
        let calculatorForTemp = Calculator()
        if let celsiusTempText = celsiusTempText {
            let fahrenheitTemp = calculatorForTemp.temperatureChange(celsiusTempText, .celsius).0
            let kelvinTemp = calculatorForTemp.temperatureChange(celsiusTempText, .celsius).1
            fahrenheitTempTextField.text = calculatorForTemp.numberFormatter(2).string(for: fahrenheitTemp)
            kelvinTempTextField.text = calculatorForTemp.numberFormatter(2).string(for: kelvinTemp)
        }
    }
    
    @IBAction func fahrenheitTemperature(_ sender: UITextField) {
        let fahrenheitTempText = Double(fahrenheitTempTextField.text!)
        let calculatorForTemp = Calculator()
        if let fahrenheitTempText = fahrenheitTempText {
            let celsiusTemp = calculatorForTemp.temperatureChange(fahrenheitTempText, .fahrenheit).0
            let kelvinTemp = calculatorForTemp.temperatureChange(fahrenheitTempText, .fahrenheit).1
            celsiusTempTextField.text = calculatorForTemp.numberFormatter(2).string(for: celsiusTemp)
            kelvinTempTextField.text = calculatorForTemp.numberFormatter(2).string(for: kelvinTemp)
        }
    }
    
    @IBAction func kelvinTemperature(_ sender: UITextField) {
        let kelvinTempText = Double(kelvinTempTextField.text!)
        let calculatorForTemp = Calculator()
        if let kelvinTempText = kelvinTempText {
            let celsiusTemp = calculatorForTemp.temperatureChange(kelvinTempText, .kelvin).0
            let fahrenheitTemp = calculatorForTemp.temperatureChange(kelvinTempText, .kelvin).1
            celsiusTempTextField.text = calculatorForTemp.numberFormatter(2).string(for: celsiusTemp)
            fahrenheitTempTextField.text = calculatorForTemp.numberFormatter(2).string(for: fahrenheitTemp)
        }
    }
    
    
    @IBAction func restart(_ sender: Any) {
        celsiusTempTextField.text = ""
        fahrenheitTempTextField.text = ""
        kelvinTempTextField.text = ""
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
