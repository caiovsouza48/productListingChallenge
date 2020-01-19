//
//  ProductDetailsTitleViewController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 14/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import ScrollingContentViewController

/// This class controls a scrollable image View with a Page Control
final class ProductDetailsImagesViewController: UIViewController {

    // MARK: - Controllers
    var imagesDataSourceController: ImagesDataSourceController = ImagesDataSourceController(images: []) {
        didSet {
            setupScrollView()
            setupPageControl()
        }
        
    }

    // MARK: - IBOutlets
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var scrollContentView: UIView!
    @IBOutlet var pageControl: UIPageControl!
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupPageControl()
    }

    private func setupScrollView() {
        scrollView.delegate = self
        scrollView.subviews.forEach { $0.removeFromSuperview() }
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(imagesDataSourceController.numberOfImages()), height: 0)
        scrollView.isPagingEnabled = true

        for index in 0 ..< imagesDataSourceController.numberOfImages() {
            let imageView = UIImageView(frame: CGRect(x: view.frame.width * CGFloat(index),
                                                      y: 0,
                                                      width: view.frame.width,
                                                      height: self.scrollView.frame.height))
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imagesDataSourceController.asyncImageAt(index) { (downloadedImage) in
                DispatchQueue.main.async {
                    imageView.image = downloadedImage
                    self.scrollView.addSubview(imageView)
                }
            }
        }
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = imagesDataSourceController.numberOfImages()
        pageControl.currentPage = 0
    }
}

// MARK: - UIScrollView Delegate
extension ProductDetailsImagesViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
