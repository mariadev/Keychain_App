//
//  Style.swift
//  Stackview
//
//  Created by Maria on 26/01/2021.
//

import UIKit

protocol Style {
    
    func dropShadow(shadowColor: CGColor, shadowOpacity: Float, shadowOffsetWidth: CGFloat, shadowOffsetHeight: CGFloat, shadowRadius: CGFloat)
    
    }

extension Style where Self : UIView {
    
    func dropShadow(shadowColor: CGColor = UIColor.gray.cgColor, shadowOpacity: Float = 0.3, shadowOffsetWidth: CGFloat = 2, shadowOffsetHeight: CGFloat = 4, shadowRadius: CGFloat = 5) {
        self.layer.shadowColor = shadowColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = CGSize(width: shadowRadius, height: shadowRadius)
        self.layer.shadowRadius = shadowRadius
        
    }
}

extension Style where Self: UICollectionViewCell{
    
    func dropShadow(shadowColor: CGColor = UIColor.gray.cgColor, shadowOpacity: Float = 0.3, shadowOffsetWidth: CGFloat = 2, shadowOffsetHeight: CGFloat = 4, shadowRadius: CGFloat = 5) {
        self.layer.shadowColor = shadowColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = CGSize(width: shadowRadius, height: shadowRadius)
        self.layer.shadowRadius = shadowRadius
        
    }
}
