//
//  FilterListPresenter.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 19/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import Foundation
import UIKit

class FilterListPresenter {
    var router: FilterListRouterProtocol?
    weak var view: FilterListViewProtocol?
    var interactor: FilterListInputInteractorProtocol?
    var products: [Product]?
    
    deinit {
        print("FilterListPresenter removed")
    }
}


// MARK: - FilterListPresenterProtocol

extension FilterListPresenter: FilterListPresenterProtocol {
    
    func viewDidLoad() {
//        view?.showMovieDetail(with: movie!)
    }
    
    func backButtonPressed(from view: UIViewController) {
        
    }
    
    
}

// MARK: - FilterListOutputInteractorProtocol

extension FilterListPresenter: FilterListOutputInteractorProtocol {
    
    
}

