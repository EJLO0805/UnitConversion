//
//  CalculateFunction.swift
//  UnitConversion
//
//  Created by 羅以捷 on 2022/8/30.
//

import Foundation

struct Calculator {
    
    func numberFormatter(_ fraction : Int) -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .halfUp
        numberFormatter.minimumFractionDigits = fraction
        return numberFormatter
    }
    
    func bmiFunction(_ height : Double, _ weight : Double) -> Double {
        let heightMeter : Double = height / 100
        let bmi = weight / (heightMeter * heightMeter)
        return bmi
    }
    
    func bmiStandard (_ bmi: Double) -> String {
        switch bmi {
            case ..<18.5 : return "過瘦\n標準值為18.5~24之間"
            case 18.5..<24 : return "正常"
            case 24..<27 : return "過重\n標準值為18.5~24之間"
            case 27..<30 : return "輕度肥胖\n標準值為18.5~24之間"
            case 30..<35 : return "中度肥胖\n標準值為18.5~24之間"
            default : return "重度肥胖\n標準值為18.5~24之間"
        }
    }
    
    enum temperatureKeyWords { case celsius, fahrenheit, kelvin}
    
    func temperatureChange(_ temperature: Double, _ keyWords : temperatureKeyWords) -> (Double, Double) {
        var celsiusTemp : Double = 0
        var fahrenheitTemp: Double = 0
        var kelvinTemp : Double = 0
        switch keyWords{
            case .celsius :
                kelvinTemp = temperature + 273.15
                fahrenheitTemp = temperature * 9 / 5 + 32
                return (fahrenheitTemp, kelvinTemp)
            case .fahrenheit:
                celsiusTemp = (temperature - 32) * 5 / 9
                kelvinTemp = (temperature + 459.67) * 5 / 9
                return (celsiusTemp, kelvinTemp)
            case .kelvin:
                celsiusTemp = temperature - 273.15
                fahrenheitTemp = temperature * 9 / 5 - 459.67
                return (celsiusTemp,fahrenheitTemp)
        }
    }

    func depositInterestCalculate(_ cash : Decimal, _ rate : Decimal, _ month : Double) -> Decimal {
        let monthOfRate = rate * 0.01 / 12
        var totalMoney : Decimal = cash
        for _ in 1...Int(month) {
            totalMoney = totalMoney * (1 + monthOfRate)
        }
        return totalMoney
    }
}
