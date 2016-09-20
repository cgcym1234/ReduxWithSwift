//
//  YYXibView.swift
//  SwiftSum
//
//  Created by sihuan on 2016/7/31.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit

public class YYXibView: YYView {
    public weak var xibContentView: UIView?
    
    public override func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview != nil && xibContentView == nil {
            loadXibView()
        }
        super.willMove(toSuperview: newSuperview)
    }
    
    func loadXibView() {
        guard let xibView = Bundle.main.loadNibNamed(self.className, owner: self, options: nil)?.first as? UIView else {
            return
        }
        xibView.backgroundColor = UIColor.clear
        xibView.translatesAutoresizingMaskIntoConstraints = true
        xibView.autoresizingMask = [
            .flexibleHeight,
            .flexibleWidth,
            .flexibleTopMargin,
            .flexibleLeftMargin,
            .flexibleBottomMargin,
            .flexibleRightMargin
        ]
        xibView.frame = self.bounds
        addSubview(xibView)
        xibContentView = xibView
    }
    
}
