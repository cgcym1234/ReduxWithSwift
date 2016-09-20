//
//  UINavigationBar+YYSDK.swift
//  SwiftSum
//
//  Created by yangyuan on 2016/9/17.
//  Copyright © 2016年 huan. All rights reserved.
//

import UIKit

extension UINavigationBar {
    //去除导航栏和tabbar的1px横线
    public func clearBottomLine() {
        /*
         要去除这1px的横线，首先应该知道它是什么，在Xcode的界面调试中可以看到，
         它是navigationBar的shadowImage，所以只要设置它为空即可，
         但是设置它为空之前应该先设置它的背景也为空
         */
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
    }
}

extension UITabBar {
    //清楚tabbar那一横线
    public func clearTopLine() {
        backgroundImage = UIImage()
        shadowImage = UIImage()
    }
}
