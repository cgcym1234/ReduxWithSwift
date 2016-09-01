//
//  YYXibView.swift
//  SwiftSum
//
//  Created by sihuan on 2016/7/31.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit

public class YYXibView: UIView {
    public weak var xibView: UIView?
    
//    public override func willMoveToSuperview(newSuperview: UIView?) {
//        if newSuperview != nil && xibView == nil {
//            loadXibView()
//        }
//        super.willMoveToSuperview(newSuperview)
//    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        loadXibView()
    }
    
    func loadXibView() {
        guard let xibView = NSBundle.mainBundle().loadNibNamed(self.classNameString, owner: self, options: nil).first as? UIView else {
            return
        }
        xibView.backgroundColor = UIColor.clearColor()
        xibView.translatesAutoresizingMaskIntoConstraints = true
        xibView.autoresizingMask = [
            .FlexibleHeight,
            .FlexibleWidth,
            .FlexibleTopMargin,
            .FlexibleLeftMargin,
            .FlexibleBottomMargin,
            .FlexibleRightMargin
        ]
        xibView.frame = self.bounds
        addSubview(xibView)
        self.xibView = xibView
    }

}