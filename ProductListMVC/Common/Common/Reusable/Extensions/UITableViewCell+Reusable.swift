//
//  UITableViewCell+Reusable.swift
//  BBKit
//
//  Created by Daniel Griso Filho on 23/05/19.
//  Copyright © 2019 GCCore Digital Technologies. All rights reserved.
//

import UIKit

extension UITableViewCell: Reusable {
    /// By default, use the name of the class as String for its reuseIdentifier
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
