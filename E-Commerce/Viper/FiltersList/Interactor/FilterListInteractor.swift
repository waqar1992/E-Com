//
//  FilterListInteractor.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 19/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import UIKit

class FilterListInteractor {
    weak var presenter: FilterListOutputInteractorProtocol?
    
}

// MARK: - FilterListInputInteractorProtocol

extension FilterListInteractor: FilterListInputInteractorProtocol {
    
    
}

extension FilterListInteractor: FilterListViewProtocol {
    
}
