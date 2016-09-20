//
//  String+YYKit.swift
//  SwiftSum
//
//  Created by sihuan on 16/3/2.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit

// MARK: - 编码，加密相关
extension String {
    public func urlEncoded() -> String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    public func urlDecoded() -> String? {
        return removingPercentEncoding
    }
    
    public func base64Encoded() -> String? {
        if let encodedData = data(using: .utf8) {
            return encodedData.base64EncodedString()
        }
        return nil
    }
}

// MARK: - convert 相关
extension String {
    public func toURL() -> URL? {
        if let urlString = urlEncoded() {
            return URL(string: urlString)
        }
        return nil
    }
    
    public func toData(encoding: Encoding = .utf8) -> Data? {
        return data(using: .utf8)
    }
    
    public func toArray() -> [String] {
        var arr = [String]()
        for char in self.unicodeScalars {
            arr.append(String(char))
        }
        return arr
    }
    
    public func toHtmlAttributedString() -> NSAttributedString? {
        guard let data = toData() else {
            return nil
        }
        let options = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType]
        return try? NSAttributedString(data: data, options: options, documentAttributes: nil)
    }
    
    public func toBase64EncodedData() -> Data? {
        return Data(base64Encoded: self)
    }
}

// MARK: - path相关
extension String {
    public func resourcePath() -> String? {
        return Bundle.main.path(forResource: self, ofType: nil)
    }
    
    public func resourceContents(encoding: Encoding = .utf8) -> String? {
        if let filePath = self.resourcePath() {
            return try? String(contentsOfFile: filePath, encoding: encoding)
        }
        return nil
    }
    
    public static func documentPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    }
}










