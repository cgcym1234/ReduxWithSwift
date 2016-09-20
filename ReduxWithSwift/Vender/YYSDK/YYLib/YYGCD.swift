//
//  YYGCD.swift
//  SwiftSum
//
//  Created by yangyuan on 2016/9/12.
//  Copyright © 2016年 huan. All rights reserved.
//

import UIKit

// MARK: - GCD的 便捷使用
class YYGCD: NSObject {
    public static let serialQueue: DispatchQueue = DispatchQueue(label: "com.yy.YYGCD")
    
    public class func mainQueue() -> DispatchQueue {
        return DispatchQueue.main
    }
    
    public class func globalQueue() -> DispatchQueue {
        return DispatchQueue.global()
    }
    
    public class func globalQueueHighPriority() -> DispatchQueue {
        return DispatchQueue.global()
    }
    
    public class func globalQueueLowPriority() -> DispatchQueue {
        return DispatchQueue.global()
    }
    
    public class func globalQueueckBackground() -> DispatchQueue {
        return DispatchQueue.global()
    }
}

// MARK: - 常规的便捷用法
extension YYGCD {
    public static func dispatchInSerialQueue(delay millisecond: Int = 0, async: Bool = true, task: @escaping () -> Void) {
        dispatch(inQueue: serialQueue, async: async, delay: millisecond, task: task)
    }
    public static func dispatchInMainQueue(delay millisecond: Int = 0, async: Bool = true, task: @escaping () -> Void) {
        dispatch(inQueue: mainQueue(), async: async, delay: millisecond, task: task)
    }
    public static func dispatchInGlobalQueue(delay millisecond: Int = 0, async: Bool = true, task: @escaping () -> Void) {
        dispatch(inQueue: globalQueue(), async: async, delay: millisecond, task: task)
    }
    public static func dispatchInHighPriorityQueue(delay millisecond: Int = 0, async: Bool = true, task: @escaping () -> Void) {
        dispatch(inQueue: globalQueueLowPriority(), async: async, delay: millisecond, task: task)
    }
    public static func dispatchInLowPriorityQueue(delay millisecond: Int = 0, async: Bool = true, task: @escaping () -> Void) {
        dispatch(inQueue: globalQueueHighPriority(), async: async, delay: millisecond, task: task)
    }
    public static func dispatchInBackgroundQueue(delay millisecond: Int = 0, async: Bool = true, task: @escaping () -> Void) {
        dispatch(inQueue: globalQueueckBackground(), async: async, delay: millisecond, task: task)
    }
}

private extension YYGCD {
    static func dispatch(inQueue queue: DispatchQueue, async: Bool, delay milliseconds: Int, task: @escaping () -> Void) {
        if milliseconds > 0 {
            let deadlineTime = DispatchTime.now() + .seconds(milliseconds * 1000)
            queue.asyncAfter(deadline: deadlineTime, execute: task)
        } else {
            async ? queue.async(execute: task) : queue.sync(execute: task)
        }
    }
}










