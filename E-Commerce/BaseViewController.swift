//
//  BaseViewController.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 18/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      setStatusBarBackgroundColor(color: UIColor.init(named: "NavBarBgColor"))
        // Do any additional setup after loading the view.
    }
    
    /**
     Set color of status bar.
     
     - parameter color: Color which will be set to status bar.
     
     - returns: void
     */
    func setStatusBarBackgroundColor(color: UIColor?) {
        if #available(iOS 13.0, *) {
            UIApplication.shared.statusBarUIView?.backgroundColor = color ?? UIColor.white
        } else{
            guard let statusBar = UIApplication.shared.statusBarUIView else { return }
            
            statusBar.backgroundColor = color
        }
        
    }
    
    func showHud()  {
        MWAActivityIndicator.shared.showActivityIndicator()
    }
    
    func hideHud() {
        MWAActivityIndicator.shared.removeAllActivityIndicator()
    }
}


extension UIApplication {
    var statusBarUIView: UIView? {
        if #available(iOS 13.0, *) {
            let tag = 38482458385
            if let statusBar = self.keyWindow?.viewWithTag(tag) {
                return statusBar
            } else {
                let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
                statusBarView.tag = tag
                
                self.keyWindow?.addSubview(statusBarView)
                return statusBarView
            }
        } else {
            if responds(to: Selector(("statusBar"))) {
                return value(forKey: "statusBar") as? UIView
            }
        }
        return nil
    }
    func removeStatusBarView() {
        if let statusBar = self.keyWindow?.viewWithTag(38482458385) {
            statusBar.removeFromSuperview()
            self.keyWindow?.willRemoveSubview(statusBar)
            self.windows[0].viewWithTag(38482458385)
            
        }
    }
}
