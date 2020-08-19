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
    //MARK: - IBOutlets
    @IBOutlet weak var simsTypeListView: TagListView!
    
    //MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
      
        simsTypeListView.addTags(["All", "Apple", "Ericsson"])
    }
    
    
    //MARK: - Functions
    
    //MARK: - IBActions
    
    @IBAction func cancelFilterButtonPressed(_ sender : UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func applyFilterButtonPressed(_ sender : UIButton){
    }
    
    
}

// MARK: TagListViewDelegate
extension FiltersListView: TagListViewDelegate{
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag pressed: \(title), \(sender)")
        tagView.isSelected = !tagView.isSelected
    }
}
