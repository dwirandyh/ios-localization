//
//  StringLocalization.swift
//  Localization
//
//  Created by Dwi Randy Herdinanto on 04/04/20.
//  Copyright © 2020 dwirandyh.com. All rights reserved.
//

import UIKit

public protocol Localizable {
    func localize()
}

public extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

extension UILabel : Localizable {
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
    }
    
    public func localize() {
        self.text = self.text?.localize()
    }
}

extension UIButton : Localizable {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
    }
    
    public func localize() {
        let controlStates: Array<UIControl.State> = [.normal, .highlighted, .disabled, .selected, .focused, .application, .reserved]
        for controlState in controlStates {
            self.setTitle(self.titleLabel?.text?.localize(), for: controlState)
        }
    }
}

extension UIBarItem: Localizable {
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
    }
    
    public func localize() {
        self.title = self.title?.localize()
    }
}


extension UINavigationItem: Localizable {
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
    }
    
    public func localize() {
        self.title = self.title?.localize()
        self.prompt = self.prompt?.localize()
    }
}
