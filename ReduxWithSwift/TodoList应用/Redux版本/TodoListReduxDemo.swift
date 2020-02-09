//
//  TodoListReduxDemo.swift
//  SwiftSum
//
//  Created by sihuan on 2016/8/9.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit

struct TodoState: StateType {
    var todoListItems: [TodoListItemModel]
    var filter: TodoFooterFilter
    var scrollToBottom: Bool
    
    init(todoListItems: [TodoListItemModel] = [TodoListItemModel](), filter: TodoFooterFilter = .all, scrollToBottom: Bool = false) {
        self.todoListItems = todoListItems
        self.filter = filter
        self.scrollToBottom = scrollToBottom
    }
}

class TodoListReduxDemo: UIViewController, StoreSubscriber {
    
    @IBOutlet weak var todoHeader: TodoHeader!
    @IBOutlet weak var todoList: TodoList!
    @IBOutlet weak var todoFooter: TodoFooter!
	
    let todoStore = Store<TodoState>(
		reducer: TodoReducer,
		state: nil
	)
    
    func newState(state: TodoState) {
        var items: [TodoListItemModel]
        switch state.filter {
        case .all:
            items = state.todoListItems
        case .completed:
            items = state.todoListItems.filter{ $0.completed }
        case .active:
            items = state.todoListItems.filter{ !$0.completed }
        }
        todoList.render(model: items)
        if state.scrollToBottom {
            todoList.scrollToBottomIfNeeded()
        }
        todoFooter.render(model: TodoFooterModel(filter: state.filter))
    }
    
    func initialization() {
        todoStore.subscribe(self)
        
        todoHeader.addButtonDicTapCallback = { [weak self] text in
            self?.todoStore.dispatch(TodoAction.add(text: text!))
        }
        todoList.todoListDidTapItemCallback = { [weak self]  itemId in
            self?.todoStore.dispatch(TodoAction.completed(id: itemId))
        }
        todoFooter.buttonDidTapCallback = { [weak self]  filter in
            self?.todoStore.dispatch(TodoAction.filter(type: filter))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extendedLayoutNone()
        initialization()
    }
    
    deinit {
        print("TodoListReduxDemo deinit")
    }
}
