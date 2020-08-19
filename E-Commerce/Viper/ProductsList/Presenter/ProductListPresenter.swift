//
//  ProductListPresenter.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 17/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import UIKit
class ProductListPresenter {
    
    var router: ProductListRouterProtocol?
    weak var view: ProductListViewProtocol?
    var interactor: ProductListInputInteractorProtocol?
    
    var route: String?
    var method: HTTPMethod?
    
    private func fetchProductList() {
        guard let route = route else {
            return
        }
        
        guard let method = method else {
            return
        }
        
        interactor?.getProductList(with: route, method: method)
    }
}

// MARK: - ProductListPresenterProtocol

extension ProductListPresenter: ProductListPresenterProtocol {
    func showFiltersView(with products: [Product], from view: BaseViewController) {
        router?.gotFiltersView(with: products, from: view)
    }
    
    func fetchProductList(with route: String, method: HTTPMethod) {
        self.route = route
        self.method = method
        fetchProductList()
    }
    
//    func changeBrand(brand: String) {
//        interactor?.changeBrand(brand: brand)
//    }
//
//    func searchPhone(brand: String, phone: String) {
//         interactor?.searchPhone(brand: brand, phone: phone)
//    }
    
    func filter(brand: String, phone: String, isFilterApply: Bool, audioJack: Bool, haveGPS: Bool){
        interactor?.filter(brand: brand, phone: phone, isFilterApply: isFilterApply, audioJack: audioJack, haveGPS: haveGPS )
    }
     
}

// MARK: - ProductListOutputInteractorProtocol

extension ProductListPresenter: ProductListOutputInteractorProtocol {
    
    func productListDidFetch(with productList: [Product], tags: [String]) {
        view?.reloadView(with: productList, tags: tags)
    }
    
    func productListDidFetch(with error: String) {
        view?.showError(with: error)
    }
    
    func productListDidFilter(with productList: [Product]) {
        view?.reloadFilterView(with: productList)
    }
}
