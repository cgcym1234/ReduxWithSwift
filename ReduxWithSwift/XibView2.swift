//
//  XibView2.swift
//  ReduxWithSwift
//
//  Created by sihuan on 2016/8/29.
//  Copyright © 2016年 huan. All rights reserved.
//

import UIKit

@IBDesignable
class XibView2: UIView {
    
    var contenView: UIView!
    
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
//    @IBInspectable var text: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let contenView = NSBundle.mainBundle().loadNibNamed(self.classNameString, owner: self, options: nil).first as? UIView else {
            return
        }
        contenView.backgroundColor = UIColor.clearColor()
        contenView.frame = self.bounds
        addSubview(contenView)
        self.contenView = contenView
        
//        textlabel.text = text
    }
    
}
