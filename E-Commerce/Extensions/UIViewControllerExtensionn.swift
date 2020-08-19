//
//  UIViewControllerExtensionn.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 19/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    enum StoryBoardName : String{
        case main = "Main"
       
    }
    /**
     Initialize a UIViewController from Storyboard.
     
     
     - returns: UIViewController.
     */
    class func instantiateViewControllerFromStoryboard<T>(storyBoardName : StoryBoardName = .main) -> T? where T : UIViewController {
        return instantiateViewController(storyBoardName: storyBoardName)
    }
    
    /**
     Initialize a UIViewController from Storyboard.
     
     
     - returns: UIViewController.
     */
    fileprivate class func instantiateViewController<T>(storyBoardName : StoryBoardName = .main) -> T? where T : UIViewController  {
        return UIViewController().currentStoryBoard(storyBoardName: storyBoardName).instantiateViewController(withIdentifier: String(describing: self)) as? T
    }
    func currentStoryBoard(storyBoardName : StoryBoardName)  -> UIStoryboard {
        return UIStoryboard(name: storyBoardName.rawValue, bundle: nil)
    }
}
