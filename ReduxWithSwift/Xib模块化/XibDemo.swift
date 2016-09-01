//
//  XibDemo1.swift
//  ReduxWithSwift
//
//  Created by sihuan on 2016/8/29.
//  Copyright © 2016年 huan. All rights reserved.
//

import UIKit

class XibDemo: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        extendedLayoutNone()
        
        addXibView1()
    }
    
    func addXibView1() {
        let view1 = XibView1.instanceFromNib()
        view1.textlabel.text = "XibView1"
        view.addSubview(view1)
    }
    
}
