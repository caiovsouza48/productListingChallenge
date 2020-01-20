//
//  ImagesDataSourceController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 14/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import class UIKit.UIImage
import class Networking.AsyncImageDownloader

struct ImagesDataSourceController {
    let images: [Imagem]
    
    func numberOfImages() -> Int {
        return images.count
    }
    
    func imageAt(index: Int) -> Imagem {
        assert(index >= 0, "Image Index Should be Greater than zero")
        return images[index]
    }
    
    func asyncImageAt(_ index: Int, completion: @escaping ((UIImage?) -> Void)) {
        let image = imageAt(index: index)
        AsyncImageDownloader.download(urlString: image.url, completion: completion)
    }
    
}
