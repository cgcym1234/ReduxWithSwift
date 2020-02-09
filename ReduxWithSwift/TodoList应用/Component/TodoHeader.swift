//
//  TodoAdd.swift
//  SwiftSum
//
//  Created by sihuan on 2016/8/8.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit


protocol YYComponent {
	
}
struct TodoHeaderModel {
    var text: String? = nil
}

class TodoHeader: YYXibView, UITextFieldDelegate, YYComponent {
    // MARK: - Initialization
    
    func initialization() {
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField.text = self.model.text
        addButton.isEnabled = (textField.text?.count)! > 0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialization()
    }
    
    deinit {
        print("TodoHeader deinit")
    }
    
    // MARK: - Public
    
    var model = TodoHeaderModel()
    var addButtonDicTapCallback: ((_ : String?) -> Void)?
    
    func render(model: Any? = nil) {
        if let outModel = model as? TodoHeaderModel {
            self.model = outModel
        }
        textField.text = self.model.text
    }
    
    // MARK: - Private
    
    @IBOutlet fileprivate weak var textField: UITextField!
    @IBOutlet fileprivate weak var addButton: UIButton!
    
    @IBAction fileprivate func addButtonDidTap(_ sender: UIButton) {
        if (textField.text?.count)! > 0 {
            addButtonDicTapCallback?(textField.text)
            textField.text = nil
            model.text = nil
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addButtonDidTap(addButton)
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        addButton.isEnabled = (textField.text?.count)! > 0
    }
}
