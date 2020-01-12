//
//  ViewController.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 12/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit

final class ProductContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let offersCountViewController as OffersCountViewController:
            offersCountViewController.offersCountPresentation = OffersCountPresentationController(offersCount: 127)
        case let offerSortOptionViewController as OfferSortOptionsViewController:
            offerSortOptionViewController.offerSortOptionController = ProductOfferSortOptionsController()
        default:
            return
        }
    }
    
}

