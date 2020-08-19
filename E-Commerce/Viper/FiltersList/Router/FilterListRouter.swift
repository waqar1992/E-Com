//
//  FilterListRouter.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 19/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import UIKit

class FilterListRouter: FilterListRouterProtocol {
    
    
    class func createFilterListModule(with filterListRef: FiltersListView, and products: [Product]) {
        let presenter = FilterListPresenter()
        presenter.products = products
        filterListRef.presenter = presenter
//        movieDetailRef.presenter?.view = movieDetailRef
        filterListRef.presenter?.router = FilterListRouter()
        
        filterListRef.presenter?.interactor = FilterListInteractor()
        filterListRef.presenter?.interactor?.presenter = presenter
    }
    
    func goBackToProductListView(from view: UIViewController) {
        
    }
    
    deinit {
        debugPrint("FilterListRouter removed")
    }
}
