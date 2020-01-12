//
//  OfferSortOptionsViewController.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 12/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit

/// Displays a view with Sort Options
final class OfferSortOptionsViewController: UIViewController {
    
    // MARK: - Action Closures
    var onPickerRowSelected: ((String) -> Void)?
    
    // MARK: - Variables
    var pickerView: UIPickerView = UIPickerView()
    var toolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    // MARK: - IBOutlets
    @IBOutlet var filterTextField: UITextField!
    
    // MARK: - Controllers
    var offerSortOptionController: OfferSortOptionsControllerProvider!
    var pickerViewController: OfferSortPickerViewController!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewController = OfferSortPickerViewController(provider: offerSortOptionController)
        setupPickerView()
        setupToolbar()
        setupFilterTextField()
    }
    
    private func setupPickerView() {
        pickerView.showsSelectionIndicator = true
        pickerView.delegate = pickerViewController
        pickerView.dataSource = pickerViewController
    }
    
    private func setupToolbar() {
        toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.barStyle = UIBarStyle.default
        toolbar.isTranslucent = true
        toolbar.tintColor = .systemBlue
        toolbar.sizeToFit()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Pronto", style: UIBarButtonItem.Style.done, target: self, action: #selector(tappedDoneButtonOnToolbar))
        toolbar.setItems([spaceButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
    }
    
    private func setupFilterTextField() {
        filterTextField.inputView = pickerView
        filterTextField.inputAccessoryView = toolbar
    }
    
    @objc private func tappedDoneButtonOnToolbar() {
        defer { filterTextField.resignFirstResponder() }
        guard let selectedRowTitle = pickerViewController.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 0), forComponent: 0) else {
            return
        }
        filterTextField.placeholder = selectedRowTitle
        onPickerRowSelected?(selectedRowTitle)
    }

}