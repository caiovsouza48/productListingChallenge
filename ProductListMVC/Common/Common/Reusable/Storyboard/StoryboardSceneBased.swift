/*********************************************
 *
 * This code is under the MIT License (MIT)
 *
 * Copyright (c) 2016 AliSoftware
 *
 *********************************************/

import UIKit

// MARK: Protocol Definition

/// Make your UIViewController subclasses conform to this protocol when:
///  * they *are* Storyboard-based, and
///  * this ViewController is not the initialViewController of your Storyboard, but a different scene
///
/// to be able to instantiate them from the Storyboard in a type-safe manner.
///
/// You need to implement `sceneStoryboard` yourself to indicate the UIStoryboard this scene is from.
public protocol StoryboardSceneBased: class {
    /// The UIStoryboard to use when we want to instantiate this ViewController
    static var sceneStoryboard: UIStoryboard { get }
    /// The scene identifier to use when we want to instantiate this ViewController from its associated Storyboard
    static var sceneIdentifier: String { get }
}

// MARK: Default Implementation

public extension StoryboardSceneBased {
    /// By default, use the `sceneIdentifier` with the same name as the class
    static var sceneIdentifier: String {
        return String(describing: self)
    }
}

// MARK: Support for instantiation from Storyboard

public extension StoryboardSceneBased where Self: UIViewController {
    /**
     Create an instance of the ViewController from its associated Storyboard and the
     Scene with identifier `sceneIdentifier` or from its Storyboard's initialViewController
     
     - returns: instance of the conforming ViewController
     */
    static func instantiate() -> Self {
        let storyboard = Self.sceneStoryboard
        
        if let viewController = storyboard.instantiateInitialViewController() as? Self {
            return viewController
        } else if let viewController = storyboard.instantiateViewController(withIdentifier: self.sceneIdentifier) as? Self {
            return viewController
        } else {
            fatalError("The viewController '\(self.sceneIdentifier)' of '\(storyboard)' is not of class '\(self)' or is not the initial view controller")
        }
    }
}