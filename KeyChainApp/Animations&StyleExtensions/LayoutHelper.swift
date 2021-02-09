//
//  LayoutHelper.swift
//  Stackview
//
//  Created by Maria on 26/01/2021.
//

import UIKit

protocol LayoutHelper {
    
    func edgeTo(_ view: UIView,
                constant: CGFloat)
    
    func setAnchor(top: NSLayoutYAxisAnchor?,
                   bottom: NSLayoutYAxisAnchor?,
                   right: NSLayoutXAxisAnchor?,
                   left: NSLayoutXAxisAnchor?,
                   paddingTop: CGFloat,
                   paddingBottom: CGFloat,
                   paddingLeft: CGFloat,
                   paddingRight: CGFloat
    )
    
    func edgeToSafeArea(_ view: UIView, constant: CGFloat)
    
    func center(bottomView: UIView, centerView: UIView)
    
    func toBottomAndCenter(bottomView: UIView, centerView: UIView, constant: CGFloat)
    
    func toTopAndCenter(topView: UIView, centerView: UIView, constant: CGFloat)
    
    func setWidthWithMultiplier(viewWidth: NSLayoutDimension,
                                multiplier: CGFloat,
                                constant: CGFloat)
    
    func setHeightMultiplier(viewHeight: NSLayoutDimension,
                             multiplier: CGFloat,
                             constant: CGFloat)
    
    func setHeight(_ height: CGFloat) -> UIView
    
    func setWidth(_ width: CGFloat) -> UIView
    
    func padding(_ margins: [Padding], amount: CGFloat)
    
}

extension LayoutHelper where Self: UIView {
    
    func edgeTo(_ view: UIView,
                constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = true
        
    }
    
    func edgeToSafeArea(_ view: UIView,
                        constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
        leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: constant).isActive = true
        trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -constant).isActive = true
        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
        
    }
    
    func toBottomAndCenter(bottomView: UIView, centerView: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -constant).isActive = true
        centerXAnchor.constraint(equalTo:  centerView.centerXAnchor).isActive = true
    }
    
    func toTopAndCenter(topView: UIView, centerView: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: topView.topAnchor, constant: -constant).isActive = true
        centerXAnchor.constraint(equalTo:  centerView.centerXAnchor).isActive = true
    }
    
    func center(bottomView: UIView, centerView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo:  centerView.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo:  centerView.centerYAnchor).isActive = true
    }
    
    
    func setAnchor(top: NSLayoutYAxisAnchor?,
                   bottom: NSLayoutYAxisAnchor?,
                   right: NSLayoutXAxisAnchor?,
                   left: NSLayoutXAxisAnchor?,
                   paddingTop: CGFloat = 0,
                   paddingBottom: CGFloat = 0,
                   paddingLeft: CGFloat = 0,
                   paddingRight: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let  right = right  {
            trailingAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let  left = left {
            leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
    }
    
    func setWidthWithMultiplier(viewWidth: NSLayoutDimension,
                                multiplier: CGFloat = 0,
                                constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: viewWidth, multiplier: multiplier, constant: constant).isActive = true
        
    }
    func setHeightMultiplier(viewHeight: NSLayoutDimension,
                             multiplier: CGFloat = 0,
                             constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: viewHeight, multiplier: multiplier, constant: constant).isActive = true
        
    }
    @discardableResult
    func setHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    @discardableResult
    func setWidth(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    func padding(_ margins: [Padding], amount: CGFloat)  {
        translatesAutoresizingMaskIntoConstraints = false
        
        margins.forEach { (padding) in
            switch padding {
            case .top:
                layoutMargins.top = amount
            case .left:
                layoutMargins.left = amount
            case .right:
                layoutMargins.right = amount
            case .bottom:
                layoutMargins.bottom = amount
            case .verticalMargins:
                layoutMargins.top = amount
                layoutMargins.bottom = amount
            case .horizontalMargins:
                layoutMargins.left = amount
                layoutMargins.right = amount
            case .allMargins:
                layoutMargins = UIEdgeInsets(top: amount, left: amount, bottom: amount, right: amount)
            }
        }
        
    }
    
    
}
