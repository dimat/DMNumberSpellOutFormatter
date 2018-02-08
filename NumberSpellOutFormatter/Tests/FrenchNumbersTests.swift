//
//  FrenchNumbersTests.swift
//  NumberSpellOutFormatter-Unit-Tests
//
//  Created by Dmitry Matyukhin on 08/02/2018.
//  Copyright © 2017 Dmitry Matyukhin. All rights reserved.
//

import XCTest
import NumberSpellOutFormatter

class FrenchNumbersTests: XCTestCase {
    
    var formatter: DMNumberSpellOutFormatter!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        guard let formatter = DMNumberSpellOutFormatter(locale: Locale(identifier: "fr")) else {
            XCTFail("Failed to initialise a formatter")
            return
        }
        self.formatter = formatter
    }
    
    func testRules() {
        let rules = formatter.availableRuleSets()
        let expectedRules = ["%spellout-numbering-year",
                             "%spellout-numbering",
                             "%spellout-cardinal-masculine",
                             "%spellout-cardinal-feminine",
                             "%spellout-ordinal-masculine-plural",
                             "%spellout-ordinal-masculine",
                             "%spellout-ordinal-feminine-plural",
                             "%spellout-ordinal-feminine"]
        XCTAssert(rules.count >= expectedRules.count)
        
        for expectedRule in expectedRules {
            XCTAssertTrue(rules.contains(expectedRule))
        }
    }
    func testSpelloutNumberingYear() {
        formatter.setRuleSet("%spellout-numbering-year")
        XCTAssertEqual(formatter.string(from: 1), "un")
        XCTAssertEqual(formatter.string(from: 11), "onze")
        XCTAssertEqual(formatter.string(from: 12), "douze")
        XCTAssertEqual(formatter.string(from: 20), "vingt")
        XCTAssertEqual(formatter.string(from: 42), "quarante-deux")
        XCTAssertEqual(formatter.string(from: 100), "cent")
    }
    
    func testSpelloutNumbering() {
        formatter.setRuleSet("%spellout-numbering")
        XCTAssertEqual(formatter.string(from: 1), "un")
        XCTAssertEqual(formatter.string(from: 11), "onze")
        XCTAssertEqual(formatter.string(from: 12), "douze")
        XCTAssertEqual(formatter.string(from: 20), "vingt")
        XCTAssertEqual(formatter.string(from: 42), "quarante-deux")
        XCTAssertEqual(formatter.string(from: 100), "cent")
    }
    
    func testSpelloutCardinalMasculine() {
        formatter.setRuleSet("%spellout-cardinal-masculine")
        XCTAssertEqual(formatter.string(from: 1), "un")
        XCTAssertEqual(formatter.string(from: 11), "onze")
        XCTAssertEqual(formatter.string(from: 12), "douze")
        XCTAssertEqual(formatter.string(from: 20), "vingt")
        XCTAssertEqual(formatter.string(from: 42), "quarante-deux")
        XCTAssertEqual(formatter.string(from: 100), "cent")
    }
    
    func testSpelloutCardinalFeminine() {
        formatter.setRuleSet("%spellout-cardinal-feminine")
        XCTAssertEqual(formatter.string(from: 1), "une")
        XCTAssertEqual(formatter.string(from: 11), "onze")
        XCTAssertEqual(formatter.string(from: 12), "douze")
        XCTAssertEqual(formatter.string(from: 20), "vingt")
        XCTAssertEqual(formatter.string(from: 42), "quarante-deux")
        XCTAssertEqual(formatter.string(from: 100), "cent")
    }
    
    func testSpelloutOrdinalMasculinePlural() {
        formatter.setRuleSet("%spellout-ordinal-masculine-plural")
        XCTAssertEqual(formatter.string(from: 1), "premiers")
        XCTAssertEqual(formatter.string(from: 11), "onzièmes")
        XCTAssertEqual(formatter.string(from: 12), "douzièmes")
        XCTAssertEqual(formatter.string(from: 20), "vingtièmes")
        XCTAssertEqual(formatter.string(from: 42), "quarante-deuxièmes")
        XCTAssertEqual(formatter.string(from: 100), "centièmes")
    }
    
    func testSpelloutOrdinalMasculine() {
        formatter.setRuleSet("%spellout-ordinal-masculine")
        XCTAssertEqual(formatter.string(from: 1), "premier")
        XCTAssertEqual(formatter.string(from: 11), "onzième")
        XCTAssertEqual(formatter.string(from: 12), "douzième")
        XCTAssertEqual(formatter.string(from: 20), "vingtième")
        XCTAssertEqual(formatter.string(from: 42), "quarante-deuxième")
        XCTAssertEqual(formatter.string(from: 100), "centième")
    }
    
    func testSpelloutOrdinalFemininePlural() {
        formatter.setRuleSet("%spellout-ordinal-feminine-plural")
        XCTAssertEqual(formatter.string(from: 1), "premières")
        XCTAssertEqual(formatter.string(from: 11), "onzièmes")
        XCTAssertEqual(formatter.string(from: 12), "douzièmes")
        XCTAssertEqual(formatter.string(from: 20), "vingtièmes")
        XCTAssertEqual(formatter.string(from: 42), "quarante-deuxièmes")
        XCTAssertEqual(formatter.string(from: 100), "centièmes")
    }
    
    func testSpelloutOrdinalFeminine() {
        formatter.setRuleSet("%spellout-ordinal-feminine")
        XCTAssertEqual(formatter.string(from: 1), "première")
        XCTAssertEqual(formatter.string(from: 11), "onzième")
        XCTAssertEqual(formatter.string(from: 12), "douzième")
        XCTAssertEqual(formatter.string(from: 20), "vingtième")
        XCTAssertEqual(formatter.string(from: 42), "quarante-deuxième")
        XCTAssertEqual(formatter.string(from: 100), "centième")
    }
    
}
