//
//  UITabBarTutorial+UIView.swift
//  uitabbartutorial
//
//  Created by Alexey Adamovsky on 06/10/2017.
//  Copyright © 2017 Alexey Adamovsky. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    public func setCornerRadius(_ radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    func roundCorners(corners:UIRectCorner, size:CGFloat){
        let path = UIBezierPath(roundedRect:self.bounds,
                                byRoundingCorners:corners,
                                cornerRadii: CGSize(width: size, height:  size))
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
}
