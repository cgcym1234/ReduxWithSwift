//
//  XibView2.swift
//  ReduxWithSwift
//
//  Created by sihuan on 2016/8/29.
//  Copyright © 2016年 huan. All rights reserved.
//

import UIKit

class XibView2: UIView {
    
    var contenView: UIView!
    
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let contenView = Bundle.main.loadNibNamed(self.className, owner: self, options: nil)?.first as? UIView else {
            return
        }

        contenView.backgroundColor = UIColor.clear
        addSubview(contenView)
        self.contenView = contenView
        
        textlabel.text = "XibView2"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contenView.frame = self.bounds
    }
    
}
