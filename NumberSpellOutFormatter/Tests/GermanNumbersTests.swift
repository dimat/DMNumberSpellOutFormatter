//
//  GermanNumbersTests.swift
//
//  Created by Dmitry Matyukhin on 08/02/2018.
//  Copyright © 2017 Dmitry Matyukhin. All rights reserved.
//

import XCTest
import NumberSpellOutFormatter

class GermanNumbersTests: XCTestCase {
    var formatter: DMNumberSpellOutFormatter!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        guard let formatter = DMNumberSpellOutFormatter(locale: Locale(identifier: "de")) else {
            XCTFail("Failed to initialise a formatter")
            return
        }
        self.formatter = formatter
    }
    
    func testRules() {
        let rules = formatter.availableRuleSets()
        let expectedRules = ["%spellout-numbering-year",
                             "%spellout-numbering",
                             "%spellout-cardinal-neuter",
                             "%spellout-cardinal-masculine",
                             "%spellout-cardinal-feminine",
                             "%spellout-cardinal-n",
                             "%spellout-cardinal-r",
                             "%spellout-cardinal-s",
                             "%spellout-ordinal",
                             "%spellout-ordinal-n",
                             "%spellout-ordinal-r",
                             "%spellout-ordinal-s"]
        XCTAssert(rules.count >= expectedRules.count)
        
        for expectedRule in expectedRules {
            XCTAssertTrue(rules.contains(expectedRule))
        }
    }
    func testSpelloutNumberingYear() {
        formatter.setRuleSet("%spellout-numbering-year")
        XCTAssertEqual(formatter.string(from: 1), "eins")
        XCTAssertEqual(formatter.string(from: 11), "elf")
        XCTAssertEqual(formatter.string(from: 12), "zwölf")
        XCTAssertEqual(formatter.string(from: 20), "zwanzig")
        XCTAssertEqual(formatter.string(from: 42), "zwei­und­vierzig")
        XCTAssertEqual(formatter.string(from: 100), "ein­hundert")
    }
    
    func testSpelloutNumbering() {
        formatter.setRuleSet("%spellout-numbering")
        XCTAssertEqual(formatter.string(from: 1), "eins")
        XCTAssertEqual(formatter.string(from: 11), "elf")
        XCTAssertEqual(formatter.string(from: 12), "zwölf")
        XCTAssertEqual(formatter.string(from: 20), "zwanzig")
        XCTAssertEqual(formatter.string(from: 42), "zwei­und­vierzig")
        XCTAssertEqual(formatter.string(from: 100), "ein­hundert")
    }
    
    func testSpelloutCardinalNeuter() {
        formatter.setRuleSet("%spellout-cardinal-neuter")
        XCTAssertEqual(formatter.string(from: 1), "ein")
        XCTAssertEqual(formatter.string(from: 11), "elf")
        XCTAssertEqual(formatter.string(from: 12), "zwölf")
        XCTAssertEqual(formatter.string(from: 20), "zwanzig")
        XCTAssertEqual(formatter.string(from: 42), "zwei­und­vierzig")
        XCTAssertEqual(formatter.string(from: 100), "ein­hundert")
    }
    
    func testSpelloutCardinalMasculine() {
        formatter.setRuleSet("%spellout-cardinal-masculine")
        XCTAssertEqual(formatter.string(from: 1), "ein")
        XCTAssertEqual(formatter.string(from: 11), "elf")
        XCTAssertEqual(formatter.string(from: 12), "zwölf")
        XCTAssertEqual(formatter.string(from: 20), "zwanzig")
        XCTAssertEqual(formatter.string(from: 42), "zwei­und­vierzig")
        XCTAssertEqual(formatter.string(from: 100), "ein­hundert")
    }
    
    func testSpelloutCardinalFeminine() {
        formatter.setRuleSet("%spellout-cardinal-feminine")
        XCTAssertEqual(formatter.string(from: 1), "eine")
        XCTAssertEqual(formatter.string(from: 11), "elf")
        XCTAssertEqual(formatter.string(from: 12), "zwölf")
        XCTAssertEqual(formatter.string(from: 20), "zwanzig")
        XCTAssertEqual(formatter.string(from: 42), "zwei­und­vierzig")
        XCTAssertEqual(formatter.string(from: 100), "ein­hundert")
    }
    
    func testSpelloutCardinalN() {
        formatter.setRuleSet("%spellout-cardinal-n")
        XCTAssertEqual(formatter.string(from: 1), "einen")
        XCTAssertEqual(formatter.string(from: 11), "elf")
        XCTAssertEqual(formatter.string(from: 12), "zwölf")
        XCTAssertEqual(formatter.string(from: 20), "zwanzig")
        XCTAssertEqual(formatter.string(from: 42), "zwei­und­vierzig")
        XCTAssertEqual(formatter.string(from: 100), "ein­hundert")
    }
    
    func testSpelloutCardinalR() {
        formatter.setRuleSet("%spellout-cardinal-r")
        XCTAssertEqual(formatter.string(from: 1), "einer")
        XCTAssertEqual(formatter.string(from: 11), "elf")
        XCTAssertEqual(formatter.string(from: 12), "zwölf")
        XCTAssertEqual(formatter.string(from: 20), "zwanzig")
        XCTAssertEqual(formatter.string(from: 42), "zwei­und­vierzig")
        XCTAssertEqual(formatter.string(from: 100), "ein­hundert")
    }
    
    func testSpelloutCardinalS() {
        formatter.setRuleSet("%spellout-cardinal-s")
        XCTAssertEqual(formatter.string(from: 1), "eines")
        XCTAssertEqual(formatter.string(from: 11), "elf")
        XCTAssertEqual(formatter.string(from: 12), "zwölf")
        XCTAssertEqual(formatter.string(from: 20), "zwanzig")
        XCTAssertEqual(formatter.string(from: 42), "zwei­und­vierzig")
        XCTAssertEqual(formatter.string(from: 100), "ein­hundert")
    }
    
    func testSpelloutOrdinal() {
        formatter.setRuleSet("%spellout-ordinal")
        XCTAssertEqual(formatter.string(from: 1), "erste")
        XCTAssertEqual(formatter.string(from: 11), "elfte")
        XCTAssertEqual(formatter.string(from: 12), "zwölfte")
        XCTAssertEqual(formatter.string(from: 20), "zwanzigste")
        XCTAssertEqual(formatter.string(from: 42), "zwei­und­vierzigste")
        XCTAssertEqual(formatter.string(from: 100), "ein­hundertste")
    }
    
    func testSpelloutOrdinalN() {
        formatter.setRuleSet("%spellout-ordinal-n")
        XCTAssertEqual(formatter.string(from: 1), "ersten")
        XCTAssertEqual(formatter.string(from: 11), "elften")
        XCTAssertEqual(formatter.string(from: 12), "zwölften")
        XCTAssertEqual(formatter.string(from: 20), "zwanzigsten")
        XCTAssertEqual(formatter.string(from: 42), "zwei­und­vierzigsten")
        XCTAssertEqual(formatter.string(from: 100), "ein­hundertsten")
    }
    
    func testSpelloutOrdinalR() {
        formatter.setRuleSet("%spellout-ordinal-r")
        XCTAssertEqual(formatter.string(from: 1), "erster")
        XCTAssertEqual(formatter.string(from: 11), "elfter")
        XCTAssertEqual(formatter.string(from: 12), "zwölfter")
        XCTAssertEqual(formatter.string(from: 20), "zwanzigster")
        XCTAssertEqual(formatter.string(from: 42), "zwei­und­vierzigster")
        XCTAssertEqual(formatter.string(from: 100), "ein­hundertster")
    }
    
    func testSpelloutOrdinalS() {
        formatter.setRuleSet("%spellout-ordinal-s")
        XCTAssertEqual(formatter.string(from: 1), "erstes")
        XCTAssertEqual(formatter.string(from: 11), "elftes")
        XCTAssertEqual(formatter.string(from: 12), "zwölftes")
        XCTAssertEqual(formatter.string(from: 20), "zwanzigstes")
        XCTAssertEqual(formatter.string(from: 42), "zwei­und­vierzigstes")
        XCTAssertEqual(formatter.string(from: 100), "ein­hundertstes")
    }

}

