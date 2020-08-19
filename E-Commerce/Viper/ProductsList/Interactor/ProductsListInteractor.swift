//
//  ProductsListInteractor.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 17/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import Foundation

class ProductListInteractor: ProductListInputInteractorProtocol {
    
    weak var presenter: ProductListOutputInteractorProtocol?
    var productService: ProductService = ProductStore.shared
    
    var productsArray = [Product]()
    var brands: [String] = []
    
    private func fetchProducts(with route: String, method: HTTPMethod) {
        
        
        
        productService.fetchProduct(with: route, method: method, successHandler: { [unowned self] (response) in
            self.productsArray += response
            if self.productsArray.isEmpty {
                
                self.presenter?.productListDidFetch(with: "No data found, please retry")
            }
            
            let uniqueBrand = Set(self.productsArray)
            self.brands = uniqueBrand.map {$0.brand}
            self.brands.insert("All", at: 0)
            self.presenter?.productListDidFetch(with: self.productsArray, tags: self.brands)
            
        }) { [unowned self] (error) in
            
           
            self.presenter?.productListDidFetch(with: self.productsArray, tags: self.brands)
            self.presenter?.productListDidFetch(with: error.localizedDescription)
        }
    }
    
    private func filterBrand(brand: String) {
        if brand == "All" {
            self.presenter?.productListDidFilter(with: productsArray)
        } else {
            let filterArray = productsArray.filter {$0.brand == brand}
            self.presenter?.productListDidFilter(with: filterArray)
        }
        
    }
    
    private func searchByPhone(brand: String, phone: String) {
        if brand == "All" {
            
            let filterData = productsArray.filter {
                return $0.phone?.range(of: phone, options: .caseInsensitive) != nil
            }
            
            self.presenter?.productListDidFilter(with: filterData)
        } else {
            let filterArray = productsArray.filter {$0.brand == brand}
            
            let filterData = filterArray.filter {
                return $0.phone?.range(of: phone, options: .caseInsensitive) != nil
            }
            
            self.presenter?.productListDidFilter(with: filterData)
        }
        
    }
    
    private func filterDB(brand: String, phone: String, isFilterApply: Bool, audioJack: Bool, haveGPS: Bool) {
        var filterBrand = [Product]()
        
        if brand == "All" {
            filterBrand = productsArray
        } else {
            filterBrand = productsArray.filter {$0.brand == brand}
        }
        
        var filterSearch = [Product]()
        
        if phone != "", phone.count > 0 {
            let filterData = filterBrand.filter {
                return $0.phone?.range(of: phone, options: .caseInsensitive) != nil
                    ||  $0.sim?.range(of: phone, options: .caseInsensitive) != nil
                    ||  $0.sim?.range(of: phone, options: .caseInsensitive) != nil
            }
            
            filterSearch = filterData
            
        } else {
            filterSearch = filterBrand
        }
        
        var filterAudioJackGPS = [Product]()
        
        if isFilterApply {
            if audioJack {
                filterAudioJackGPS.append(contentsOf:  filterSearch.filter {$0.audioJack == "Yes"})
            } else {
                filterAudioJackGPS.append(contentsOf: filterSearch.filter {$0.audioJack == "No"})
            }
            
            if haveGPS {
                filterAudioJackGPS.append(contentsOf:  filterSearch.filter {$0.gps == "Yes"})
            } else {
                filterAudioJackGPS.append(contentsOf: filterSearch.filter {$0.gps == "No"})
            }
            
        } else {
            filterAudioJackGPS = filterSearch
        }
        
        self.presenter?.productListDidFilter(with: filterAudioJackGPS)
    }

// MARK: - ProductListInputInteractorProtocol  
    func getProductList(with route: String, method: HTTPMethod) {
        fetchProducts(with: route, method: method)
    }
    
    //    func changeBrand(brand: String) {
    //        filterBrand(brand: brand)
    //    }
    //
    //    func searchPhone(brand: String, phone: String) {
    //        searchByPhone(brand: brand, phone: phone)
    //    }
    
    func filter(brand: String, phone: String, isFilterApply: Bool, audioJack: Bool, haveGPS: Bool) {
        filterDB(brand: brand, phone: phone, isFilterApply: isFilterApply, audioJack: audioJack, haveGPS: haveGPS)
    }
}

