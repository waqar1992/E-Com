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
}
