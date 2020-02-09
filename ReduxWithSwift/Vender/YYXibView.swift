//
//  YYXibView.swift
//  SwiftSum
//
//  Created by sihuan on 2016/7/31.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit


public class YYXibView: UIView {
    public weak var xibContentView: UIView?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadXibView()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadXibView()
    }
    
    func loadXibView() {
        guard let xibView = Bundle.main.loadNibNamed(self.className, owner: self, options: nil)?.first as? UIView else {
            return
        }
        xibView.backgroundColor = UIColor.clear
        addSubview(xibView)
        
        xibView.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: xibView, attribute: .top, relatedBy: .equal, toItem: xibView.superview, attribute: .top, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: xibView, attribute: .leading, relatedBy: .equal, toItem: xibView.superview, attribute: .leading, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: xibView, attribute: .bottom, relatedBy: .equal, toItem: xibView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint(item: xibView, attribute: .trailing, relatedBy: .equal, toItem: xibView.superview, attribute: .trailing, multiplier: 1, constant: 0)
        xibView.superview?.addConstraints([top, left, bottom, right])
        
        xibContentView = xibView
    }
    
}
