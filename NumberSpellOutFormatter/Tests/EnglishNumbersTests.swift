//
//  EnglishNumbersTests.swift
//
//  Created by Dmitry Matyukhin on 08/02/2018.
//  Copyright © 2017 Dmitry Matyukhin. All rights reserved.
//

import XCTest
import NumberSpellOutFormatter

class EnglishNumbersTests: XCTestCase {
    var formatter: DMNumberSpellOutFormatter!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        guard let formatter = DMNumberSpellOutFormatter(locale: Locale(identifier: "en")) else {
            XCTFail("Failed to initialise a formatter")
            return
        }
        self.formatter = formatter
    }
    
    func testRules() {
        let rules = formatter.availableRuleSets()
        let expectedRules = ["%spellout-numbering-year",
                             "%spellout-numbering",
                             "%spellout-numbering-verbose",
                             "%spellout-cardinal",
                             "%spellout-cardinal-verbose",
                             "%spellout-ordinal",
                             "%spellout-ordinal-verbose"]
        XCTAssert(rules.count >= expectedRules.count)
        
        for expectedRule in expectedRules {
            XCTAssertTrue(rules.contains(expectedRule))
        }
    }
    func testSpelloutNumberingYear() {
        formatter.setRuleSet("%spellout-numbering-year")
        XCTAssertEqual(formatter.string(from: 1), "one")
        XCTAssertEqual(formatter.string(from: 11), "eleven")
        XCTAssertEqual(formatter.string(from: 12), "twelve")
        XCTAssertEqual(formatter.string(from: 20), "twenty")
        XCTAssertEqual(formatter.string(from: 42), "forty-two")
        XCTAssertEqual(formatter.string(from: 100), "one hundred")
    }
    
    func testSpelloutNumbering() {
        formatter.setRuleSet("%spellout-numbering")
        XCTAssertEqual(formatter.string(from: 1), "one")
        XCTAssertEqual(formatter.string(from: 11), "eleven")
        XCTAssertEqual(formatter.string(from: 12), "twelve")
        XCTAssertEqual(formatter.string(from: 20), "twenty")
        XCTAssertEqual(formatter.string(from: 42), "forty-two")
        XCTAssertEqual(formatter.string(from: 100), "one hundred")
    }
    
    func testSpelloutNumberingVerbose() {
        formatter.setRuleSet("%spellout-numbering-verbose")
        XCTAssertEqual(formatter.string(from: 1), "one")
        XCTAssertEqual(formatter.string(from: 11), "eleven")
        XCTAssertEqual(formatter.string(from: 12), "twelve")
        XCTAssertEqual(formatter.string(from: 20), "twenty")
        XCTAssertEqual(formatter.string(from: 42), "forty-two")
        XCTAssertEqual(formatter.string(from: 100), "one hundred")
    }
    
    func testSpelloutCardinal() {
        formatter.setRuleSet("%spellout-cardinal")
        XCTAssertEqual(formatter.string(from: 1), "one")
        XCTAssertEqual(formatter.string(from: 11), "eleven")
        XCTAssertEqual(formatter.string(from: 12), "twelve")
        XCTAssertEqual(formatter.string(from: 20), "twenty")
        XCTAssertEqual(formatter.string(from: 42), "forty-two")
        XCTAssertEqual(formatter.string(from: 100), "one hundred")
    }
    
    func testSpelloutCardinalVerbose() {
        formatter.setRuleSet("%spellout-cardinal-verbose")
        XCTAssertEqual(formatter.string(from: 1), "one")
        XCTAssertEqual(formatter.string(from: 11), "eleven")
        XCTAssertEqual(formatter.string(from: 12), "twelve")
        XCTAssertEqual(formatter.string(from: 20), "twenty")
        XCTAssertEqual(formatter.string(from: 42), "forty-two")
        XCTAssertEqual(formatter.string(from: 100), "one hundred")
    }
    
    func testSpelloutOrdinal() {
        formatter.setRuleSet("%spellout-ordinal")
        XCTAssertEqual(formatter.string(from: 1), "first")
        XCTAssertEqual(formatter.string(from: 11), "eleventh")
        XCTAssertEqual(formatter.string(from: 12), "twelfth")
        XCTAssertEqual(formatter.string(from: 20), "twentieth")
        XCTAssertEqual(formatter.string(from: 42), "forty-second")
        XCTAssertEqual(formatter.string(from: 100), "one hundredth")
    }
    
    func testSpelloutOrdinalVerbose() {
        formatter.setRuleSet("%spellout-ordinal-verbose")
        XCTAssertEqual(formatter.string(from: 1), "first")
        XCTAssertEqual(formatter.string(from: 11), "eleventh")
        XCTAssertEqual(formatter.string(from: 12), "twelfth")
        XCTAssertEqual(formatter.string(from: 20), "twentieth")
        XCTAssertEqual(formatter.string(from: 42), "forty-second")
        XCTAssertEqual(formatter.string(from: 100), "one hundredth")
    }
}
