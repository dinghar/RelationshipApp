//
//  ImageDataLayer.swift
//  ElsieApp
//
//  Created by Ross Harding on 8/28/19.
//  Copyright © 2019 Harding LLC. All rights reserved.
//

import UIKit
import FirebaseStorage

class ImageDataLayer: NSObject {
    
    func loadImage(from url: String, completion: @escaping (UIImage?) -> ()) {
        if url == "" {
            return
        }
        let photoRef = Storage.storage().reference(withPath: url)
        photoRef.getData(maxSize: 1024 * 1024 * 1024) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            } else {
                let image = UIImage(data: data!)
                completion(image)
            }
        }
    }

}
