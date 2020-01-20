//
//  MoreInfoDataSourceController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 15/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import Common

/// Controls the Data Source for the Info View Controller
struct MoreInfoDataSourceController {
    let dataSource: [MaisInformacoes]
    
    func infoAt(_ index: Int) -> MaisInformacoes {
        assert(index >= 0, "Index Should be Greater Than Zero")
        return dataSource[index]
    }
    
    func moreInfoValueAt(_ index: Int, section: Int) -> Valor {
        return dataSource[section].valores[index]
    }
    
    func numberOfInfos() -> Int {
        return dataSource.count
    }
    
    func numberOfValues(forSection section: Int) -> Int {
        return dataSource[section].valores.count
    }
    
}
