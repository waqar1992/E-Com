//
//  ProductListPresenterProtocol.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 18/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import UIKit

protocol ProductListPresenterProtocol: class {
    
    var interactor: ProductListInputInteractorProtocol? {get set}
    var view: ProductListViewProtocol? {get set}
    var router: ProductListRouterProtocol? {get set}
    
    //View -> Presenter
    func fetchProductList(with route: String, method: HTTPMethod)
    func showFiltersView(with products: [Product],from view: UIViewController)
    func filter(brand: String, phone: String, isFilterApply: Bool, audioJack: Bool)
}

protocol ProductListInputInteractorProtocol: class {
    
    var presenter: ProductListOutputInteractorProtocol? {get set}
    
    //Presenter -> Interactor
    func getProductList(with route: String, method: HTTPMethod)
//    func changeBrand(brand: String)
//    func searchPhone(brand: String, phone: String)
    
    func filter(brand: String, phone: String, isFilterApply: Bool, audioJack: Bool)
}

protocol ProductListOutputInteractorProtocol: class {
    
    //Interactor -> Presenter
    func productListDidFetch(with productList: [Product], tags: [String])
    func productListDidFetch(with error: String)
    
    func productListDidFilter(with productList: [Product])
}

protocol ProductListViewProtocol: class {
    
    // Presenter -> View
    func reloadView(with products: [Product], tags: [String])
    func showError(with error: String)
    
    func reloadFilterView(with products: [Product])
}

protocol ProductListRouterProtocol: class {
    
    //Presenter -> Router
    func gotFiltersView(with products: [Product], from view: UIViewController)
    static func createProductListModule(productListRef: ProductsListView)
}
