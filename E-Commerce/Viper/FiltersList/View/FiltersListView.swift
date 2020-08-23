//
//  FiltersListView.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 18/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import UIKit

class FiltersListView: BaseViewController {
    
    //MARK: - Properties
    var presenter: FilterListPresenterProtocol?
    var products :[Product]?
    var delegate: FilterProtocolDelegate?
    
    //MARK: - IBOutlets
    @IBOutlet weak var audioJackSegmentButton: UISegmentedControl!
    @IBOutlet weak var gpsSegmentButton: UISegmentedControl!
    @IBOutlet weak var minPriceTextFiled: UITextField!
    @IBOutlet weak var maxPriceTextFiled: UITextField!
    
    //MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        let vc = self.presentingViewController as? UINavigationController
        let vc1 = vc?.topViewController as! ProductsListView as ProductsListView
        delegate = vc1
    }
    
    
    //MARK: - Functions
    
    //MARK: - IBActions
    
    @IBAction func cancelFilterButtonPressed(_ sender : UIButton){
        self.delegate?.applyFilter(isFilterApply: false, audioJack: false, isGPS:false, minPrice: minPriceTextFiled.text?.toDouble(), maxPrice: maxPriceTextFiled.text?.toDouble())
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func applyFilterButtonPressed(_ sender : UIButton){
        self.delegate?.applyFilter(isFilterApply: true, audioJack: ((audioJackSegmentButton.selectedSegmentIndex) == 0 ? true: false), isGPS: ((gpsSegmentButton.selectedSegmentIndex) == 0 ? true: false), minPrice: minPriceTextFiled.text?.toDouble(), maxPrice: maxPriceTextFiled.text?.toDouble())
        self.dismiss(animated: true, completion: nil)
    }
}


//MARK: - UITextFiledDelegates

extension FiltersListView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == minPriceTextFiled {
            maxPriceTextFiled.becomeFirstResponder()
            return true
        }else if textField == maxPriceTextFiled{
            _ = textField.becomeFirstResponder()
            return false
        } else{
            return true
        }
    }
}
