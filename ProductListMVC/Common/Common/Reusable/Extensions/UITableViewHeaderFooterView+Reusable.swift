//
//  UITableViewHeaderFooterView+Reusable.swift
//  Common
//
//  Created by Caio de Souza on 15/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewHeaderFooterView: Reusable {
    /// By default, use the name of the class as String for its reuseIdentifier
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
