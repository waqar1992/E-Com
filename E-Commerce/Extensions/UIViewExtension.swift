//
//  UIViewExtension.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 19/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    public class func fromNib() -> Self {
        return fromNib(nibName: nil)
    }
    
    public class func fromNib(nibName: String?) -> Self {
        func fromNibHelper<T>(nibName: String?) -> T where T : UIView {
            let bundle = Bundle(for: T.self)
            let name = nibName ?? String(describing: T.self)
            return bundle.loadNibNamed(name, owner: nil, options: nil)?.first as? T ?? T()
        }
        return fromNibHelper(nibName: nibName)
    }
    
    
    /**
     Adds description view as sub view to UIView.
     
     - parameter imageName: Image name for description view.
     - parameter description: Text to be displayed in description view.
     
     - returns: void.
     */
    func showDescriptionViewWithImage(_ imageName:String = "Info", description: String?) {
        
        if let myDescriptionView = self.viewWithTag(998877) as? DescriptionView {
            
            myDescriptionView.setDescriptionViewWithImage(imageName, description: description)
            
        } else {
            
            let myDescriptionView: DescriptionView = DescriptionView.fromNib()
            myDescriptionView.setDescriptionViewWithImage(imageName, description: description)
            myDescriptionView.translatesAutoresizingMaskIntoConstraints = false
            
            self.addSubview(myDescriptionView)
            self.bringSubviewToFront(myDescriptionView)
            
            let leadingConstraint = NSLayoutConstraint(item: myDescriptionView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
            
            let trailingConstraint = NSLayoutConstraint(item: myDescriptionView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
            
            let verticalCenterConstraint = NSLayoutConstraint(item: myDescriptionView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
            
            let horizantalCenterConstraint = NSLayoutConstraint(item: myDescriptionView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
            
            self.addConstraints([leadingConstraint, trailingConstraint, verticalCenterConstraint, horizantalCenterConstraint])
            
        }
    }
    
    ///Hide description view
    func hideDescriptionView() {
        if let myDescriptionView = self.viewWithTag(998877) as? DescriptionView {
            
            myDescriptionView.isHidden = true
            myDescriptionView.removeFromSuperview()
        }
    }
    
    
}
