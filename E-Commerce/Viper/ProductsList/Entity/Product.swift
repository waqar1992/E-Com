//
//  Product.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 17/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import Foundation
public struct Product: Codable, Hashable {
    
    public let id: Int
    public let brand: String
    public let phone: String?
    public let picture: String?
    
    public var pictureURL: URL {
        return URL(string: "\(picture ?? "")")!
    }
    
    //public let announceDate: String
    public let sim: String?
    public let resolution: String?
    public let audioJack: String?
    public let gps: String?
    public let battery: String?
    public let priceEur: Int?
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
       
    }
//    public var hashValue: Int { return brand.hashValue }
}

public func ==(lhs: Product, rhs: Product) -> Bool {
    return lhs.brand == rhs.brand
}
