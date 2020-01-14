//
//  ArrowView.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 13/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit

enum ArrowPosition {
    case left
    case down
    case right
    case up
}

/// Createss an Arrow using BezierPath
class ArrowView: UIView {
    let shapeLayer = CAShapeLayer()
    var arrowColor: UIColor = .black {
        didSet {
            shapeLayer.fillColor = arrowColor.cgColor
        }
    }

    var position: ArrowPosition = .down {
        didSet {
            switch position {
            case .left:
                self.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
                break
            case .down:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
                break
            case .right:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
                break
            case .up:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                break
            }
        }
    }

    init(origin: CGPoint, size: CGFloat) {
        super.init(frame: CGRect(x: origin.x, y: origin.y, width: size, height: size))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {

        // Get size
        let size = self.layer.frame.width

        // Create path
        let bezierPath = UIBezierPath()

        // Draw points
        let qSize = size / 4

        bezierPath.move(to: CGPoint(x: 0, y: qSize))
        bezierPath.addLine(to: CGPoint(x: size, y: qSize))
        bezierPath.addLine(to: CGPoint(x: size / 2, y: qSize * 3))
        bezierPath.addLine(to: CGPoint(x: 0, y: qSize))
        bezierPath.close()

        // Mask to path
        shapeLayer.path = bezierPath.cgPath
        //  shapeLayer.fillColor = arrowColor.cgColor

        if #available(iOS 12.0, *) {
            self.layer.addSublayer(shapeLayer)
        } else {
            self.layer.mask = shapeLayer
        }
    }
}
