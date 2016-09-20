//
//  XibView1.swift
//  ReduxWithSwift
//
//  Created by sihuan on 2016/8/29.
//  Copyright © 2016年 huan. All rights reserved.
//

import UIKit

class XibView1: UIView {
    
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    static func instance() -> XibView1 {
        return self.instanceFromNib() as! XibView1
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        translatesAutoresizingMaskIntoConstraints = true
        autoresizingMask = []
    }
    
}
