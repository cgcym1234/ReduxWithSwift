//
//  YYAnimation.swift
//  SwiftSum
//
//  Created by sihuan on 16/5/12.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit

// MARK: - 一些通用的动画
public enum YYAnimation {
    case none
    case fadeIn, fadeOut
    case zoomIn, zoomOut
}

extension YYAnimation {
    static let Duration = 0.3
    static let ZoomScaleOffset = CGFloat(0.2)
    
    static func animate(withView view: UIView, duration: TimeInterval = Duration, delay: TimeInterval = 0, type: YYAnimation = .none, completion: ((Bool) -> Void)? = nil) {
        var options: UIViewAnimationOptions = []
        var animations: () -> Void = {}
        switch type {
        case .none:
            break
        case .fadeIn:
            options = [.curveEaseIn]
            view.alpha = 0
            animations = { view.alpha = 1 }
        case .fadeOut:
            options = [.curveEaseOut]
            view.alpha = 1
            animations = { view.alpha = 0 }
        case .zoomIn:
            options = [.curveEaseIn]
            view.transform = view.transform.scaledBy(x: 1.0 - ZoomScaleOffset, y: 1.0 - ZoomScaleOffset)
            animations = { view.transform = CGAffineTransform.identity }
        case .zoomOut:
            options = [.curveEaseOut]
            view.transform = view.transform.scaledBy(x: 1.0 + ZoomScaleOffset, y: 1.0 + ZoomScaleOffset)
            animations = { view.transform = CGAffineTransform.identity }
        }
        
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: animations, completion: completion)
    }
}






