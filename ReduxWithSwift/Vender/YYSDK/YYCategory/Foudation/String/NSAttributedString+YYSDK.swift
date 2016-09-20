//
//  NSAttributeString+YYExtension.swift
//  SwiftSum
//
//  Created by sihuan on 16/6/2.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit

extension NSAttributedString {
    public func toHtmlString() -> String? {
        guard let htmlData = try? data(from: NSRange(location: 0, length: length), documentAttributes: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType]) else {
            return nil
        }
        return String(data: htmlData, encoding: .utf8)
    }
    
}
