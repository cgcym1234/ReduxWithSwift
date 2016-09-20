//
//  NSDate+YYKit.swift
//  SwiftSum
//
//  Created by sihuan on 16/4/24.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit

struct TimeValues {
    static let defaultFormatter = DateFormatter()
    static let defaultFormat = "yyyy-MM-dd HH:mm:ss"
    static let defaultTimeZone = TimeZone.current
    static let defaultLocale = Locale.autoupdatingCurrent
}

// MARK: - to String
extension Date {
    public func stringWithFormat(_ format: String? = nil, timeZone: TimeZone? = nil, locale: Locale? = nil) -> String {
        let formatter = TimeValues.defaultFormatter
        formatter.dateFormat = format ?? TimeValues.defaultFormat
        formatter.timeZone = timeZone ?? TimeValues.defaultTimeZone
        formatter.locale = locale ?? TimeValues.defaultLocale
        
        return formatter.string(from: self)
    }
}














