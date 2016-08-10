//
//  ViewController.swift
//  ReduxWithSwift
//
//  Created by sihuan on 2016/8/10.
//  Copyright © 2016年 huan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        extendedLayoutNone()
        
        addButtonToView(title: "组件模式写的TodoList") { [weak self] (button) in
            let vc = TodoListDemo()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        addButtonToView(title: "Redux架构写的TodoList") { [weak self] (button) in
            let vc = TodoListReduxDemo()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

