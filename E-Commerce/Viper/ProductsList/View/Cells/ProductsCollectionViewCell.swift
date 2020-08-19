//
//  ProductsCollectionViewCell.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 18/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    //MARK: - Properties
    public var product: Product? {
        didSet {
            guard let product = product else {
                return
            }

            productImageView.setImage(with: product.pictureURL)
            productPriceLabel.text = String.init(format: "%d", (product.priceEur ?? 0)).asLocaleCurrency
            productNameLabel.text = product.phone
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var productPriceLabel: UILabel!
    
    //MARK: - CollectionViewCell Methods
    override func awakeFromNib() {
      super.awakeFromNib()
      containerView.layer.cornerRadius = 5
      containerView.layer.masksToBounds = true
    }
    
    
    
}
