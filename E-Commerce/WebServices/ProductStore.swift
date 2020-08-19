//
//  ProductStore.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 17/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import Foundation

public class ProductStore: ProductService {
    
    public static let shared = ProductStore()
    private init() {}
    
    private let urlSession = URLSession.shared
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
    
    public func fetchProduct(with route: String, method: HTTPMethod, successHandler: @escaping (_ response: [Product]) -> Void, errorHandler: @escaping(_ error: Error) -> Void) {
        
        let url = URL(string: String.init(format: "%@%@", Constants.BASE_API_URL,route))
        
        guard let apiURL = url else {
            return
        }
        
        var request = URLRequest(url: apiURL)
        request.httpMethod = "GET"
        request.setValue(Constants.HEADER_VALUE, forHTTPHeaderField: Constants.HEADER_KEY)
        
        urlSession.dataTask(with: request) { (data, response, error) in
            if error != nil {
                self.handleError(errorHandler: errorHandler, error: ProductError.apiError)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.handleError(errorHandler: errorHandler, error: ProductError.invalidResponse)
                return
            }
            
            guard let data = data else {
                self.handleError(errorHandler: errorHandler, error: ProductError.noData)
                return
            }
            
            do {
                let productsResponse = try self.jsonDecoder.decode(Array<Product>.self, from: data)
                DispatchQueue.main.async {
                    successHandler(productsResponse)
                }
            } catch {
                self.handleError(errorHandler: errorHandler, error: ProductError.serializationError)
            }
        }.resume()
        
    }
    
    private func handleError(errorHandler: @escaping(_ error: Error) -> Void, error: Error) {
        DispatchQueue.main.async {
            errorHandler(error)
        }
    }
    
}
