//
//  TodoList.swift
//  SwiftSum
//
//  Created by sihuan on 2016/8/8.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit

struct TodoListItemModel {
    var id: Int = 0
    var text = ""
    var completed = false
    
    init(text: String, completed: Bool) {
        self.text = text
        self.completed = completed
        
        //不能用该方式来做hash，因为在比较多的值拷贝的时候，可能会复用这块内存
        //id = unsafeAddressOf("\(self)").hashValue
    }
    
    init() {
    }
}

class TodoList: YYXibView, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Initialization
    
    func initialization() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 40
        tableView.register(TodoListItem.self, forCellReuseIdentifier: "TodoListItem")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialization()
    }
    
    // MARK: - Public
    
    var model = [TodoListItemModel]()
    var todoListDidTapItemCallback: ((_ itemId : Int) -> Void)?
    
    func render(model: Any? = nil) {
        if let outModel = model as? [TodoListItemModel] {
            self.model = outModel
        }
        tableView.reloadData()
    }
    
    func scrollToBottomIfNeeded(_ animated: Bool = true) {
        if self.model.count > 4 {
            tableView.scrollToBottom()
        }
    }
    
    // MARK: - Private
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListItem", for: indexPath) as! TodoListItem
        cell.render(model: model[(indexPath as NSIndexPath).row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        todoListDidTapItemCallback?(model[(indexPath as NSIndexPath).row].id)
    }
}

class TodoListItem: UITableViewCell, YYComponent {
    var model = TodoListItemModel()
    
    func render(model: Any? = nil) {
        if let outModel = model as? TodoListItemModel {
            self.model = outModel
        }
        let text = self.model.text
        if self.model.completed {
            textLabel?.text = nil
            textLabel?.attributedText = NSAttributedString(string: text, attributes: [NSStrikethroughStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue])
            textLabel?.textColor = UIColor.orange
        } else {
            textLabel?.attributedText = nil
            textLabel?.text = self.model.text
            textLabel?.textColor = UIColor.black
        }
        
    }
}



















