//
//  ViewController+YYKit.swift
//  SwiftSum
//
//  Created by sihuan on 16/3/31.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit

extension NSObject {
    // MARK: - 返回类名的String
    public static var className: String {
        return String(describing: self)
    }
    
    public var className: String {
        return type(of: self).className
    }
}

extension UIView {
    // MARK: - 根据xib生成对象
    public static func instanceFromNib() -> UIView? {
        return Bundle(for: self).loadNibNamed(self.className, owner: nil, options: nil)?.first as? UIView
    }
}

extension UIScrollView {
    public func scrollToBottom(animated: Bool = true) {
        DispatchQueue.main.async {
            self.setContentOffset(CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height), animated: animated)
        }
    }
}

extension UIViewController {
    public func extendedLayoutNone() {
        edgesForExtendedLayout = []
        automaticallyAdjustsScrollViewInsets = false
    }
    
    
}

// MARK: - 快速添加一个按钮
class _YYButton: UIButton {
    var action: ((UIButton) -> Void)? = nil
}

var k_buttonCount: UInt8 = 0

extension UIViewController {
    public var buttonCount: Int {
        get {
            let value = objc_getAssociatedObject(self, &k_buttonCount) as? Int
            return value ?? 0 //初始化为0
        }
        set {
            objc_setAssociatedObject(self, &k_buttonCount, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func addButtonToView(title: String, action: @escaping (UIButton) -> Void) {
        buttonCount += 1
        addButtonToView(title: title, frame: CGRect(x: 0, y: 40*buttonCount, width: 320, height: 40), action: action)
    }
    
    @discardableResult public func addButtonToView(title: String, frame: CGRect, action: @escaping (UIButton) -> Void) -> UIButton {
        let button = _YYButton(type: .system)
        button.action = action
        button.frame = frame
        button.contentHorizontalAlignment = .center
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(yyButtonClicked(button:)), for: .touchUpInside)
        view.addSubview(button)
        return button
    }
    
    @objc func yyButtonClicked(button: _YYButton) {
        if let action = button.action {
            action(button);
        }
    }
}
















