//
//  UIButton+LocalizableUI.swift
//  Pods
//
//  Created by Philipp Weiß on 01.08.17.
//
//

import Foundation
import UIKit

extension UIButton: Localizable {
    /// Convenience int for a new button with a type and
    /// the localized key for the title
    ///
    /// - Parameters:
    ///   - type: The buttons type
    ///   - localizedKey: The key for the button title
    public convenience init(type: UIButton.ButtonType, localizedKey: String?) {
        self.init(type: type)
        self.localizedKey = localizedKey
    }

    /// Updates all subviews with their given localizedKeys
    public func updateLocalizedStrings() {
        if let localizedKey = localizedKey {
            let localizedContent = LocalizationManager.localizedStringFor(localizedKey)
            setTitle(localizedContent, for: .normal)
        }
    }
}
