//
//  DescriptionView.swift
//  NoDataFoundView
//
//  Created by Muhammad Waqar Ahmed on 18/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import UIKit

class DescriptionView: UIView {
    
    @IBOutlet weak var descriptionImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setDescriptionViewWithImage(_ imageName:String = "Info", description: String?) {
        
        self.tag = 998877
        descriptionImageView.image = UIImage.init(named: imageName)
        descriptionLabel.text = description ?? ""
        self.layoutIfNeeded()
    }
}

