//
//  NSObject+YYKit.swift
//  SwiftSum
//
//  Created by sihuan on 16/3/31.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit

extension NSObject {
    // MARK: - 返回类名的String
    public static var className: String {
        /**
         默认是这样的 "SwiftSum.SimpleGestureRecognizers"
         
         其实这里的真正的类型名字还带有 module 前缀，也就是 Swift.String。
         直接 print 只是调用了 CustomStringConvertible 中的相关方法而已，
         你可以使用 debugPrint 来进行确认。
         关于更多地关于 print 和 debugPrint 的细节，
         可以参考 http://swifter.tips/print/
         */
        //        return self.description()
        
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    public var className: String {
        return type(of: self).className
    }
    
    // MARK: - 根据类名来实例化对象
    public func instanceFrom(className: String) -> AnyObject? {
        if let classType = swiftClassFrom(className: className) {
            return (classType as! NSObject.Type).init()
        }

        return nil
    }
    
    //NSClassFromString 在Swift中已经 no effect
    public func swiftClassFrom(className: String) -> AnyClass? {
        if  let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            // generate the full name of your class (take a look into your "SHCC-swift.h" file)
            let classStringName = "_TtC\(appName.characters.count)\(appName)\(className.characters.count)\(className)"
            let cls: AnyClass?  = NSClassFromString(classStringName)
            //            cls = NSClassFromString("\(appName).\(className)")
            //            assert(cls != nil, "class notfound,please check className")
            return cls
        }
        return nil;
    }
}
