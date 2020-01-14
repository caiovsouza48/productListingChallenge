//
//  UIViewController+StoryboardLoadable.swift
//  BBKit
//
//  Created by Daniel Griso Filho on 23/05/19.
//  Copyright © 2019 GCCore Digital Technologies. All rights reserved.
//

import UIKit

extension UIViewController: StoryboardSceneBased {
    
    public static var sceneStoryboard: UIStoryboard {
        return UIStoryboard(name: String(describing: self), bundle: Bundle(for: self))
    }
}
