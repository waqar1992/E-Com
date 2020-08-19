//
//  FilterListProtocol.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 19/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import UIKit

protocol FilterListPresenterProtocol: class {
    
    var interactor: FilterListInputInteractorProtocol? {get set}
    var router: FilterListRouterProtocol? {get set}
    var view: FilterListViewProtocol? {get set}
    
    //View -> Presenter
    func viewDidLoad()
    func backButtonPressed(from view: UIViewController)
    
}

protocol FilterListInputInteractorProtocol: class {
    
    var presenter: FilterListOutputInteractorProtocol? {get set}
    
    //Presenter -> Interactor
    
}

protocol FilterListOutputInteractorProtocol: class {
    
    //Interactor -> Presenter
   
}

protocol FilterListViewProtocol: class {
    
    //Presenter -> View
  
}

protocol FilterListRouterProtocol: class {
    
    //Presenter -> Router
    func goBackToProductListView(from view: UIViewController)
}

