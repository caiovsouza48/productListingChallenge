//
//  MainCoordinator.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 12/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import Core
import Common

class MainCoordinator: Coordinator {
    
    var parent: Coordinator?

    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
    
    }

}

