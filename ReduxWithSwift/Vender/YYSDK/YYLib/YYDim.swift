//
//  YYDim.swift
//  SwiftSum
//
//  Created by sihuan on 16/5/12.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit

public struct YYDimOpitions: OptionSet {
    public var rawValue = 0  // 因为RawRepresentable的要求
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    static var dim = YYDimOpitions(rawValue: 1 << 0)//蒙版效果，黑色透明背景，否则为透明
    static var modal = YYDimOpitions(rawValue: 1 << 1)//模态显示，禁止背后的view交互，否则不影响
    static var dismissTaped = YYDimOpitions(rawValue: 1 << 2)//点击空白地方自动消失
}

public enum YYDimAnimation {
    case none
    case fade
    case zoom
}

extension YYDim {
    func show(withView view: UIView? = nil, options: YYDimOpitions = [], animationType: YYDimAnimation = .none, animations: (() -> Void)? = nil, completion: ((Bool) -> Void)? = nil) {
        
        
        
        YYAnimation.animate(withView: self, duration: 0, delay: 0, type: .none) { (f) in
            
        }
    }
}

public class YYDim: UIView {
    
    // MARK: - Const
    
    let HeightForCommonCell = 49
    let CellIdentifier = "CellIdentifier"
    
    // MARK: - Property
    
    weak var showView: UIView?
    
    // MARK: - Initialization
    
    override public func awakeFromNib() {
        self.setContext()
    }
    
    func setContext() {
        self.frame = UIScreen.main.bounds
    }
    
    // MARK: - Override
    
    override public func layoutSubviews() {
        self.frame = UIScreen.main.bounds
    }
    
    // MARK: - Private
    
    func _private() -> Void {
    }
    
    // MARK: - Public
    
    
    // MARK: - Delegate
    
    
}
