//
//  LocalizationExtension.swift
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
    
    // Add additional parameter for localization key
    @IBInspectable var LocalizedKey: String? {
        get { return nil }
        set(key) {
            text = key?.localize()
        }
    }
    
    public func localize() {
        guard let textString = text, textString.first == "@" else { return }
        self.text = String(textString.dropFirst()).localize()
    }
}


extension UIButton : Localizable {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
    }
    
    // Add additional parameter for localization key
    @IBInspectable var LocalizedKey: String? {
        get { return nil }
        set(key) {
            let controlStates: Array<UIControl.State> = [.normal, .highlighted, .disabled, .selected, .focused, .application, .reserved]
            for controlState in controlStates {
                self.setTitle(key?.localize(), for: controlState)
            }
        }
    }
    
    public func localize() {
        guard let textString = self.titleLabel?.text, textString.first == "@" else { return }
        let controlStates: Array<UIControl.State> = [.normal, .highlighted, .disabled, .selected, .focused, .application, .reserved]
        for controlState in controlStates {
            self.setTitle(String(textString.dropFirst()).localize(), for: controlState)
        }
    }
}


extension UIBarItem: Localizable {
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
    }
    
    // Add additional parameter for localization key
    @IBInspectable var LocalizedKey: String? {
        get { return nil }
        set(key) {
            self.title = key?.localize()
        }
    }
    
    public func localize() {
        guard let textString = self.title, textString.first == "@" else { return }
        self.title = String(textString.dropFirst()).localize()
    }
}



extension UINavigationItem: Localizable {
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
    }
    
    // Add additional parameter for localization key
    @IBInspectable var LocalizedTitleKey: String? {
        get { return nil }
        set(key) {
            self.title = key?.localize()
        }
    }
    
    // Add additional parameter for localization key
    @IBInspectable var LocalizedPromptKey: String? {
        get { return nil }
        set(key) {
            self.prompt = key?.localize()
        }
    }
    
    public func localize() {
        if let titleString = self.title {
            if titleString.first == "@" {
                self.title = String(titleString.dropFirst()).localize()
            }
        }
        if let promptString = self.prompt {
            if promptString.first == "@" {
                self.prompt = String(promptString.dropFirst()).localize()
            }
        }
    }
}

extension UISegmentedControl: Localizable {
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
    }
    
    public func localize() {
        for index in 0...(numberOfSegments - 1) {
            let title = self.titleForSegment(at: index)
            if let textString = title, title?.first == "@" {
                self.setTitle(String(textString.dropFirst()).localize(), forSegmentAt: index)
            }
        }
    }
}

extension UIImageView {
    public func localize(localized: String) {
        let languageCode = Locale.current.languageCode ?? "en"
        let imageName = "\(localized)_\(languageCode)"
        self.image = UIImage(named: imageName)
    }
    
    @IBInspectable
    var localizedImage: String? {
        get {
            return nil
        }
        set(key) {
            guard let localizedKey = key else { return }
            self.localize(localized: localizedKey)
        }
    }
}
