//
//  WKWebView+YYExtension.swift
//  SwiftSum
//
//  Created by sihuan on 16/5/19.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import WebKit

// MARK: - Load
extension WKWebView {
    
    public func loadUrlString(_ urlString: String) -> Bool {
        if let url = urlString.toURL() {
            load(URLRequest(url: url))
            return true
        }
        return false
    }
    
    public func loadLocalHTML(_ htmlName: String) -> Bool {
        if let htmlPath = Bundle.main.path(forResource: htmlName, ofType: nil) {
            if let appHtml = try? String(contentsOfFile: htmlPath, encoding: .utf8) {
                let baseUrl = htmlPath.toURL()
                loadHTMLString(appHtml, baseURL: baseUrl)
                return true
            }
        }
        return false
    }
}
