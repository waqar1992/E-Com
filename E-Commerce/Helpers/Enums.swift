//
//  Enums.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 17/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import Foundation

public enum ProductError: Error {
    case apiError
    case invalidProduct
    case invalidResponse
    case noData
    case serializationError
}

public enum HTTPMethod: String {
    case GET
}
