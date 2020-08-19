//
//  ProductsService.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 17/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import Foundation
protocol ProductService {
    
    func fetchProduct(with route: String, method: HTTPMethod, successHandler: @escaping (_ response: [Product]) -> Void, errorHandler: @escaping(_ error: Error) -> Void)
}
