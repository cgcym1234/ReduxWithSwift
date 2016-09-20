//
//  YYButton.swift
//  Swift3Sum
//
//  Created by sihuan on 2016/6/28.
//  Copyright © 2016年 huan. All rights reserved.
//

import UIKit

@IBDesignable
open class YYButton: UIButton {

    // MARK: - IBDesignable
    //圆角
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    //边框宽度
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    //边框颜色
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }

}
