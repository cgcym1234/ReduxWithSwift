//
//  UIImage+YYKit.swift
//  SwiftSum
//
//  Created by sihuan on 2016/7/20.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit

extension UIImage {
    
    public func tint(color: UIColor, blendMode: CGBlendMode) -> UIImage {
        let drawRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        //let context = UIGraphicsGetCurrentContext()
        //CGContextClipToMask(context, drawRect, CGImage)
        color.setFill()
        UIRectFill(drawRect)
        draw(in: drawRect, blendMode: blendMode, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
    
    public func fitSize(in view: UIView? = nil) -> CGSize {
        let imageWidth = self.size.width
        let imageHeight = self.size.width
        let containerWidth = view != nil ? view!.bounds.size.width : UIScreen.main.bounds.size.width
        let containerHeight = view != nil ? view!.bounds.size.height : UIScreen.main.bounds.size.height
        
        let overWidth = imageWidth > containerWidth
        let overHeight = imageHeight > containerHeight
        
        let timesThanScreenWidth = imageWidth / containerWidth
        let timesThanScreenHeight = imageHeight / containerHeight
        
        var fitSize = CGSize(width: imageWidth, height: imageHeight)
        
        if overWidth && overHeight {
            fitSize.width = timesThanScreenWidth > timesThanScreenHeight ? containerWidth : imageWidth / timesThanScreenHeight
            fitSize.height = timesThanScreenWidth > timesThanScreenHeight ? imageHeight / timesThanScreenWidth : containerHeight
        } else {
            if overWidth && !overHeight {
                fitSize.width = containerWidth
                fitSize.height = containerHeight / timesThanScreenWidth
            } else if (!overWidth && overHeight) {
                //fitSize.width = containerWidth / timesThanScreenHeight
                fitSize.height = containerHeight
            }
        }
        return fitSize
    }
}




























