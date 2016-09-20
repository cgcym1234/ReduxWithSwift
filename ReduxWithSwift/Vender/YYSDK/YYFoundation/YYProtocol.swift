//
//  YYProtocol.swift
//  SwiftSum
//
//  Created by sihuan on 16/6/6.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit

// MARK: - Cell配置协议
public protocol YYCellRenderable {
    func rederWithMode(model: AnyObject, indexPath: NSIndexPath?, containerView: UIView?)
}

public protocol YYRenderable {
    func render(model: Any?)
}
public protocol YYComponent: YYRenderable {
    
}

// MARK: - 通知相关协议
public protocol YYNotificationType {
    associatedtype Notification: RawRepresentable
    
    static func postNotification(notification: Notification, object: AnyObject?, userInfo: [String : AnyObject]?)
    static func addObserver(observer: AnyObject, selector: Selector, notification: Notification, object: AnyObject?)
    static func removeObserver(observer: AnyObject, notification: Notification?, object: AnyObject?)
}

public extension YYNotificationType where Notification.RawValue == String {
    
    // MARK: - 避免通知名称冲突
    
    //给这个协议加一个拓展方法来生成唯一的通知名称。因为这个方法只需要内部知道，所以标记为private。
    private static func notificationName(_ notification: Notification) -> String {
        return "\(self).\(notification.rawValue)"
    }
    
    // MARK: - 协议的默认实现方法
    public static func postNotification(notification: Notification, object: AnyObject? = nil, userInfo: [String : AnyObject]? = nil) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: notificationName(notification)), object: object, userInfo: userInfo)
    }
    public static func addObserver(observer: AnyObject, selector: Selector, notification: Notification, object: AnyObject? = nil) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(rawValue: notificationName(notification)), object: object)
    }
    public static func removeObserver(observer: AnyObject, notification: Notification? = nil, object: AnyObject? = nil) {
        if let notification = notification {
            NotificationCenter.default.removeObserver(observer, name: NSNotification.Name(rawValue: notificationName(notification)), object: object)
        } else {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}


