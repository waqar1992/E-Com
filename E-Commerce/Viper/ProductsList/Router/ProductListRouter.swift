//
//  ProductListRouter.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 17/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import UIKit

// MARK: - ProductListRouterProtocol

class ProductListRouter: ProductListRouterProtocol {
    
    func gotFiltersView(with products: [Product], from view: UIViewController) {
        if let filtersViewController : FiltersListView = FiltersListView.instantiateViewControllerFromStoryboard(){
//            postReviewVC.orderInfo = myOrderInfo
           view.navigationController?.present(filtersViewController, animated: true, completion: nil)
        }
    }
    
    
    class func createProductListModule(productListRef: ProductsListView) {
        let presenter: ProductListPresenterProtocol & ProductListOutputInteractorProtocol = ProductListPresenter()
        
        productListRef.presenter = presenter
        productListRef.presenter?.router = ProductListRouter()
        productListRef.presenter?.view = productListRef
        productListRef.presenter?.interactor = ProductListInteractor()
        productListRef.presenter?.interactor?.presenter = presenter
    }
    
}
