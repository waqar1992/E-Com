//
//  BrandsCollectionViewCell.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 17/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import UIKit

class BrandsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet var brandNameLabel :UILabel!
    @IBOutlet var selectionIndicator :UIView!
    
    //MARK: - CollectionViewCell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Functions
    func setBrandInfo (brandName: String?, selectedPosition: Int?, currentPosition: Int?){
        brandNameLabel.text = brandName ?? ""
        brandNameLabel.textColor = (selectedPosition == currentPosition) ? #colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1) : UIColor.lightGray
        selectionIndicator.backgroundColor = (selectedPosition == currentPosition) ? #colorLiteral(red: 0.937254902, green: 0.4666666667, blue: 0.137254902, alpha: 0.8000000119) : UIColor.white
    }
}
