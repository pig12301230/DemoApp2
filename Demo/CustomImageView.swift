//
//  CustomImageView.swift
//  Demo
//
//  Created by 莊英祺 on 2019/8/7.
//  Copyright © 2019 Winston. All rights reserved.
//

import Foundation
import UIKit

fileprivate let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    var imageUrl: URL?
    func download(from url: URL, placeholder: UIImage?) {
        self.image = nil
        self.imageUrl = url
        
        if let cachedImage = imageCache.object(forKey: NSString(string: url.absoluteString)) {
            self.image = cachedImage
        }
        URLSession.shared.dataTask(with: url) { (data, reponse, error) in
            if let err = error {
                print(err)
                self.image = placeholder
                return
            }
            DispatchQueue.main.async {
                if let imageData = data, let image = UIImage(data: imageData) {
                    imageCache.setObject(image, forKey: NSString(string: url.absoluteString))
                    if self.imageUrl == url {
                        self.image = image
                    }
                }
            }
            }.resume()
    }
}
