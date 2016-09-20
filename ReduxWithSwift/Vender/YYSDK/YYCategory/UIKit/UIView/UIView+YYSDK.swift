//
//  UIView+YYKit.swift
//  SwiftSum
//
//  Created by sihuan on 16/3/31.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit


extension UIView {
    // MARK: - 根据xib生成对象
    public static func instanceFromNib() -> UIView? {
        return Bundle(for: self).loadNibNamed(self.className, owner: nil, options: nil)?.first as? UIView
    }
    
    // MARK: - 设为圆形
    public func setRounded(radius: CGFloat? = nil) {
        let r = radius ?? min(self.frame.size.width, self.frame.size.height)/2;
        self.layer.cornerRadius = r
        self.clipsToBounds = true
    }
    
    //设置view的anchorPoint，同时保证view的frame不改变
    public func setAnchorPoint(_ anchorPoint: CGPoint) {
        let oldOrigin = frame.origin
        layer.anchorPoint = anchorPoint
        let newOrign = frame.origin
        let transition = CGPoint(x: newOrign.x - oldOrigin.x, y: newOrign.y - oldOrigin.y)
        center = CGPoint(x: center.x - transition.x, y: center.y - transition.y)
    }
}

extension UIView {
    /**
     添加填满父view的约束
     */
    public func addConstraintFillSuperView() {
        if let superview = superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1, constant: 0)
            let left = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1, constant: 0)
            let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1, constant: 0)
            let right = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1, constant: 0)
            superview.addConstraints([top, left, bottom, right])
        }
    }
}














