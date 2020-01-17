//
//  OfferSortPickerViewController.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 12/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import UIKit

/// Controls the UIPickerView in OfferSort View
class OfferSortPickerViewController: NSObject {
    
    var provider: OfferSortOptionsControllerProvider
    
    init(provider: OfferSortOptionsControllerProvider) {
        self.provider = provider
    }
}

// MARK: - UIPickerViewDataSource
extension OfferSortPickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return provider.sortOptions.count
    }
}

// MARK: - UIPickerViewDelegate
extension OfferSortPickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return provider.sortOptions[row]
    }
}
