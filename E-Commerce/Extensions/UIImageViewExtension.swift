//
//  UIImageViewExtension.swift
//  E-Commerce
//
//  Created by Muhammad Waqar Ahmed on 17/08/2020.
//  Copyright © 2020 MWA. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    ///Lazy Load and Cache UIImageView with a place holder
    func setImage(with url: URL, placeHolder: UIImage = #imageLiteral(resourceName: "placeholder")) {
        
        self.image = placeHolder
        if let cachedImage = imageCache.object(forKey: NSString(string: url.absoluteString)) {
            self.image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if error != nil {
                debugPrint(error?.localizedDescription ?? "error downloading image from server")
                DispatchQueue.main.async {
                    self.image = placeHolder
                }
                return
            }
            DispatchQueue.main.async {
                if let data = data {
                    if let downloadedImage = UIImage(data: data) {
                        imageCache.setObject(downloadedImage, forKey: NSString(string: url.absoluteString))
                        self.image = downloadedImage
                    }
                }
            }
        }).resume()
    }
}
