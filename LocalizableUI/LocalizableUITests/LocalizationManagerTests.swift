//
//  LocalizationManager.swift
//  LocalizableUITests
//
//  Created by Jan Weiß on 15.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
import LocalizableUI

private enum Constants {
    static let sampleStringKey = "localized-key-1"
    static let localizedSampleStringEn = "Sample1"
    static let localizedSampleStringDe = "Test1"
}

class LocalizationManagerTests: BaseTestCase {
    
    func testChangeLanguageWithCustomBundle() {
        XCTAssertEqual(NSLocalizedString(Constants.sampleStringKey, bundle: Bundle(for: type(of: self)), comment: ""), Constants.localizedSampleStringEn)

        changeLanguage()
        XCTAssertEqual(NSLocalizedString(Constants.sampleStringKey, bundle: Bundle(for: type(of: self)), comment: ""), Constants.localizedSampleStringEn)
    }

    func testErrorLanguageChanged() {
        XCTAssertThrowsError(try LocalizationManager.sharedInstance().changeLanguage(to: "NotExistingStringTable"))
    }
    
    func testDeinitLocalizationManager() {
        LocalizationManager.clear()
    }
    
}