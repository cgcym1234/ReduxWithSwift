//
//  TodoFooter.swift
//  SwiftSum
//
//  Created by sihuan on 2016/8/8.
//  Copyright © 2016年 sihuan. All rights reserved.
//

import UIKit


enum TodoFooterFilter: Int {
    case all, completed, active
}

struct TodoFooterModel {
    var filter = TodoFooterFilter.all
}

class TodoFooter: YYXibView, YYComponent {
    // MARK: - Initialization
    
    func initialization() {
        allButton.tag = TodoFooterFilter.all.rawValue
        completedButton.tag = TodoFooterFilter.completed.rawValue
        activeButton.tag = TodoFooterFilter.active.rawValue
        buttons.append(allButton)
        buttons.append(completedButton)
        buttons.append(activeButton)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialization()
        updateButtonState()
    }
    
    // MARK: - Public
    
    var model = TodoFooterModel()
    var buttonDidTapCallback: ((_ : TodoFooterFilter) -> Void)?
    
    func render(model: Any? = nil) {
        if let outModel = model as? TodoFooterModel {
            self.model = outModel
        }
        updateButtonState()
    }
    
    // MARK: - Private
    
    var buttons = [UIButton]()
    @IBOutlet fileprivate weak var textlabel: UILabel!
    @IBOutlet fileprivate weak var allButton: UIButton!
    @IBOutlet fileprivate weak var completedButton: UIButton!
    @IBOutlet fileprivate weak var activeButton: UIButton!
    
    
    
    @IBAction fileprivate func buttonDidTap(_ sender: UIButton) {
        let filter = TodoFooterFilter(rawValue: sender.tag)!
        model.filter = filter
        //updateButtonState()
        buttonDidTapCallback?(filter)
    }
    
    func updateButtonState() {
        for button in buttons {
            button.isEnabled = model.filter.rawValue != button.tag
        }
    }
}












