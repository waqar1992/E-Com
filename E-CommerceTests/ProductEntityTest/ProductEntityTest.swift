//
//  ProductEntityTest.swift
//  E-CommerceTests
//
//  Created by Muhammad Waqar Ahmed on 19/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import XCTest
@testable import E_Commerce
class ProductEntityTest: XCTestCase {
    var product : Product!
    override func setUpWithError() throws {
        product = Product.init(id: 1, brand: "Apple", phone: "iPhone 6", picture: nil, sim: "No Sim", resolution: "123", audioJack: "No", gps: "NO", battery: "1234", priceEur: 15.0)
    }
    
    override func tearDownWithError() throws {
        product = nil
    }
    
    func testExample() throws {
        XCTAssertEqual(product.brand, "Apple")
        XCTAssertEqual(product.phone, "iPhone 6")
        XCTAssertEqual(product.priceEur, 15.0)
        XCTAssertEqual(product.pictureURL, URL.init(string: Constants.BASE_API_URL))
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
