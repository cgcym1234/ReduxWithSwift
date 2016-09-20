//
//  YYStruct.swift
//  SwiftSum
//
//  Created by sihuan on 16/6/6.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit

// MARK: - UITabBarController子controller信息的模型，
public struct TabBarItemInfo {
    public var storyBoardName: String!
    public var tabTitle: String?
    //    var titleNav: String?
    public var imageName: String?
    public var imageNameSelected: String?
    
    public init(storyBoardName: String, tabTitle: String? = nil, imageName: String? = nil, imageNameSelected: String? = nil) {
        self.storyBoardName = storyBoardName
        self.tabTitle = tabTitle
        self.imageName = imageName
        self.imageNameSelected = imageNameSelected
    }
}
