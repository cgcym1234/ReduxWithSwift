//
//  TodoList.swift
//  SwiftSum
//
//  Created by sihuan on 2016/8/8.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit

class TodoListDemo: UIViewController {
    
    @IBOutlet weak var todoHeader: TodoHeader!
    @IBOutlet weak var todoList: TodoList!
    @IBOutlet weak var todoFooter: TodoFooter!
    
    var todoHeaderModel = TodoHeaderModel()
    var todoListModel = [TodoListItemModel]()
    var todoFooterModel = TodoFooterModel()
    
    func initialization() {
        // MARK: - 注意：如果使用这里的renderTodoList函数会造成self无法释放，因为在函数里面使用的是strong self
        func renderTodoList(_ scrollToBottom: Bool = true) {
            let filter = todoFooterModel.filter
            let newModel: [TodoListItemModel]
            switch filter {
            case .all:
                newModel = todoListModel
            case .completed:
                newModel = todoListModel.filter { $0.completed }
            case .active:
                newModel = todoListModel.flatMap { !$0.completed ? $0 : nil  }
            }
            todoList.render(model: newModel)
            if scrollToBottom {
                todoList.scrollToBottomIfNeeded()
            }
        }
        
        todoHeader.addButtonDicTapCallback = { [weak self] text in
            if self == nil {
                return
            }
            if let text = text {
                var item = TodoListItemModel(text: text, completed: false)
                item.id = self!.todoListModel.count
                self?.todoListModel.append(item)
                self?.renderTodoList()
                
                //注意：函数内的renderTodoList会造成循环引用
                //renderTodoList()
            }
        }
        todoList.todoListDidTapItemCallback = { [weak self] itemId in
            if self != nil {
                for index in 0 ..< self!.todoListModel.count {
                    let item = self!.todoListModel[index]
                    if item.id == itemId {
                        self!.todoListModel[index].completed = !item.completed
                        break
                    }
                }
                self?.renderTodoList(false)
            }
        }
        todoFooter.buttonDidTapCallback = { [weak self] filter in
            if self != nil {
                self!.todoFooterModel.filter = filter
                self?.renderTodoList()
                self?.todoFooter.render(model: TodoFooterModel(filter: filter))
            }
        }
    }
    
    // MARK: - 注意：renderTodoList函数最好不要放在initialization里面，因为在函数里面使用的是strong self
    func renderTodoList(_ scrollToBottom: Bool = true) {
        let filter = todoFooterModel.filter
        let newModel: [TodoListItemModel]
        switch filter {
        case .all:
            newModel = todoListModel
        case .completed:
            newModel = todoListModel.filter { $0.completed }
        case .active:
            newModel = todoListModel.flatMap { !$0.completed ? $0 : nil  }
        }
        todoList.render(model: newModel)
        if scrollToBottom {
            todoList.scrollToBottomIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extendedLayoutNone()
        initialization()
    }
    
    deinit {
        print("TodoListDemo deinit")
    }
}

