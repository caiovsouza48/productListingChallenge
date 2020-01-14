//
//  AsyncImageDownloader.swift
//  Networking
//
//  Created by Caio de Souza on 14/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit

public class AsyncImageDownloader {
    public static func download(urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            guard let data = data, error == nil else { return }
            let imageFromData = UIImage(data: data)
            completion(imageFromData)
        }.resume()
    }

}
