//
//  AvaliationDataSourceController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 16/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

struct AvaliationDataSourceController {
    let dataSource: [Opiniao]
    
    func numberOfAvaliations() -> Int {
        return dataSource.count
    }
    
    func avaliationAt(_ index: Int) -> Opiniao {
        assert(index >= 0, "Index Should be Greater Than Zero")
        return dataSource[index]
    }
}
