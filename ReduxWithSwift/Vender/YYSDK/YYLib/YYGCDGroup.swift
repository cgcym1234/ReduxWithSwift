//
//  YYGCDGroup.swift
//  SwiftSum
//
//  Created by yangyuan on 2016/9/13.
//  Copyright © 2016年 huan. All rights reserved.
//

import UIKit


public class YYGCDGroup {
    public let dispatchGroup = DispatchGroup()
    
    public func enter() {
        dispatchGroup.enter()
    }
    public func leave() {
        dispatchGroup.leave()
    }
    public func waitForever() {
        _ = dispatchGroup.wait(timeout: DispatchTime.distantFuture)
    }
    public func wait(milliseconds: Int) -> DispatchTimeoutResult {
        return dispatchGroup.wait(timeout: DispatchTime.now() + .seconds(milliseconds * 1000))
    }
    
    public func notifyInMainQueue(task: @escaping () -> Void) {
        dispatchGroup.notify(queue: YYGCD.mainQueue(), execute: task)
    }
}





















