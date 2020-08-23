//
//  StringExtension.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 17/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import Foundation
extension String {
    func trimWhiteSpace() -> String {
        let string = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return string
    }
    
    
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    var  asLocaleCurrency:String{
       
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.locale =  Locale.init(identifier: "ar_AE") //Locale.current //For current locatoin
        formatter.currencySymbol = "AED"
        formatter.maximumFractionDigits = 2
        formatter.usesGroupingSeparator = true
        return "\(formatter.string(from: NSNumber.init(value: self.floatValue))!)"
    }
    
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
    
    var bool: Bool? {
        switch self.lowercased() {
        case "true", "t", "yes", "y", "1":
            return true
        case "false", "f", "no", "n", "0":
            return false
        default:
            return nil
        }
    }
}

extension Optional where Wrapped == Bool {
  func toString(_ nilString: String = "nil") -> String {
    self.map { String($0) } ?? nilString
  }
}
