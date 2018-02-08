//
//  GenericTests.swift
//
//  Created by Dmitry Matyukhin on 08/02/2018.
//  Copyright © 2017 Dmitry Matyukhin. All rights reserved.
//

import XCTest
@testable import NumberSpellOutFormatter

class GenericTests: XCTestCase {
    func testCurrentLocale() {
        let formatter = DMNumberSpellOutFormatter()
        let rules = formatter.availableRuleSets()
        XCTAssertFalse(rules.isEmpty)
    }
    
    func testUnsupportedLocale() {
        let formatter = DMNumberSpellOutFormatter(locale: Locale(identifier: "zzx"))
        XCTAssertNil(formatter)
    }
    
    func testUnsupportedRule() {
        guard let formatter = DMNumberSpellOutFormatter(locale: Locale(identifier: "en")) else {
            XCTFail("Failed to initialise a formatter")
            return
        }
        
        XCTAssertFalse(formatter.setRuleSet("%spellout-unsupported"))
    }
    
    func testSupportedRule() {
        guard let formatter = DMNumberSpellOutFormatter(locale: Locale(identifier: "en")) else {
            XCTFail("Failed to initialise a formatter")
            return
        }
        
        XCTAssertTrue(formatter.setRuleSet("%spellout-numbering"))
    }
    
    func testAvailableRules() {
        guard let formatter = DMNumberSpellOutFormatter(locale: Locale(identifier: "en")) else {
            XCTFail("Failed to initialise a formatter")
            return
        }
        
        let firstRulesSet = formatter.availableRuleSets()
        XCTAssertFalse(firstRulesSet.isEmpty)
        
        // make sure that caching works
        let secondRulesSet = formatter.availableRuleSets()
        XCTAssertEqual(secondRulesSet, firstRulesSet)
    }
}
