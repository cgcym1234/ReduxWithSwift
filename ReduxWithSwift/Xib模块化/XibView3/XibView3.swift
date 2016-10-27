//
//  XibView3.swift
//  ReduxWithSwift
//
//  Created by yangyuan on 2016/9/1.
//  Copyright © 2016年 huan. All rights reserved.
//

import UIKit

@IBDesignable
class XibView3: YYXibView {

    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBInspectable var text: String? {
        didSet {
            textlabel.text = text
        }
    }
    @IBInspectable var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
