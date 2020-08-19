//
//  ActivityIndicator.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 19/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import Foundation
import UIKit

public class MWAActivityIndicator {
    
    // MARK:- Shared Instance
    public static let shared = MWAActivityIndicator()
    
    // MARK:- Properties
    private var container: UIView = UIView()
    private var loadingView: UIView = UIView()
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    //private let containerViewTag = 92119211
    
    /*
     Show customized activity indicator,
     actually add activity indicator to passing view
     */
    func showActivityIndicator() {
        container.tag = 92119211
        
        if let window = UIApplication.shared.keyWindow {
            container.frame = window.frame
            container.center = window.center
            

            container.backgroundColor = UIColor.white.withAlphaComponent(0.5)
            
            loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            loadingView.center = container.center
            loadingView.backgroundColor = UIColor.clear
            loadingView.clipsToBounds = true
            loadingView.layer.cornerRadius = 10
            
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40);
            activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
            activityIndicator.color = UIColor.black
            activityIndicator.center = CGPoint(x:loadingView.frame.size.width / 2,y: loadingView.frame.size.height / 2);
            
            loadingView.addSubview(activityIndicator)
            container.addSubview(loadingView)
            
            window.addSubview(container)
            window.bringSubviewToFront(container)
            
            activityIndicator.startAnimating()
        }
    }
    
    /*
     Hide activity indicator
     Actually remove activity indicator from its superView
     */
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
    /*
     Hide all activity indicator
     Actually remove activity indicator from its superView
     */
    func removeAllActivityIndicator() {
        let window = UIApplication.shared.keyWindow
        
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
        window?.subviews.forEach({ (aView) in
            
            // If found in window subview then remove
            if aView.tag == 92119211 {
                
                if let activityIndicator = (aView.subviews.first ?? UIView()).subviews.first as? UIActivityIndicatorView {
                    activityIndicator.stopAnimating()
                }
                aView.removeFromSuperview()
            }
        })
    }
}
