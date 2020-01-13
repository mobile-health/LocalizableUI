//
//  UIAlertAction.swift
//  LocalizableUI
//
//  Created by Philipp Weiß on 23.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import Foundation

private var AssociatedObjectPointerLocalizable: UInt8 = 0

extension UIAlertAction: Localizable {
    // Stores the property of the localized key
    public var localizedTitleKey: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectPointerLocalizable) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectPointerLocalizable, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateLocalizedStrings()

            // Add the Element to the LocalizationManager
            addToManager()
        }
    }

    public convenience init(localizedTitleKey: String, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?) {
        let title = LocalizationManager.localizedStringFor(localizedTitleKey)
        self.init(title: title, style: style, handler: handler)
        self.localizedTitleKey = localizedTitleKey
    }

    public func updateLocalizedStrings() {
        if let localizedTitleKey = self.localizedTitleKey {
            let title = LocalizationManager.localizedStringFor(localizedTitleKey)
            setValue(title, forKeyPath: "title")
        }
    }
}
