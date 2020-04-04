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
        let key = String(self.dropFirst())
        return NSLocalizedString(key, comment: "")
    }
}

extension UILabel : Localizable {
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
    }
    
    public func localize() {
        guard let textString = text, textString.first == "@" else { return }
        self.text = textString.localize()
    }
}

extension UIButton : Localizable {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
    }
    
    public func localize() {
        guard let textString = self.titleLabel?.text, textString.first == "@" else { return }
        let controlStates: Array<UIControl.State> = [.normal, .highlighted, .disabled, .selected, .focused, .application, .reserved]
        for controlState in controlStates {
            self.setTitle(textString.localize(), for: controlState)
        }
    }
}

extension UIBarItem: Localizable {
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
    }
    
    public func localize() {
        guard let textString = self.title, textString.first == "@" else { return }
        self.title = textString.localize()
    }
}


extension UINavigationItem: Localizable {
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
    }
    
    public func localize() {
        if let titleString = self.title {
            if titleString.first == "@" {
                self.title = titleString.localize()
            }
        }
        if let promptString = self.prompt {
            if promptString.first == "@" {
                self.prompt = promptString.localize()
            }
        }
    }
}
