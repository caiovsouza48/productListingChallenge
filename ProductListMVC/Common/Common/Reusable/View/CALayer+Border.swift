//
//  CALayer+Border.swift
//  Common
//
//  Created by Caio de Souza on 13/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Encontrado em https://stackoverflow.com/questions/17355280/how-to-add-a-border-just-on-the-top-side-of-a-uiview
extension CALayer {
    
    public func addBorder(edge: UIRectEdge, color: CGColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case .bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
            break
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case .right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        default:
            break
        }
        border.backgroundColor = color;
        addSublayer(border)
        
    }
}

