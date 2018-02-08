//
//  EnglishNumbersTests.swift
//
//  Created by Dmitry Matyukhin on 08/02/2018.
//  Copyright © 2017 Dmitry Matyukhin. All rights reserved.
//

import XCTest
import NumberSpellOutFormatter

class RussianNumbersTests: XCTestCase {
    var formatter: DMNumberSpellOutFormatter!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        guard let formatter = DMNumberSpellOutFormatter(locale: Locale(identifier: "ru")) else {
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
                             "%spellout-cardinal-neuter",
                             "%spellout-cardinal-feminine",
                             "%spellout-cardinal-plural",
                             "%spellout-cardinal-masculine-genitive",
                             "%spellout-cardinal-neuter-genitive",
                             "%spellout-cardinal-feminine-genitive",
                             "%spellout-cardinal-plural-genitive",
                             "%spellout-cardinal-masculine-dative",
                             "%spellout-cardinal-neuter-dative",
                             "%spellout-cardinal-feminine-dative",
                             "%spellout-cardinal-plural-dative",
                             "%spellout-cardinal-masculine-accusative",
                             "%spellout-cardinal-neuter-accusative",
                             "%spellout-cardinal-feminine-accusative",
                             "%spellout-cardinal-plural-accusative",
                             "%spellout-cardinal-masculine-locative",
                             "%spellout-cardinal-neuter-locative",
                             "%spellout-cardinal-feminine-locative",
                             "%spellout-cardinal-plural-locative",
                             "%spellout-cardinal-masculine-ablative",
                             "%spellout-cardinal-neuter-ablative",
                             "%spellout-cardinal-feminine-ablative",
                             "%spellout-cardinal-plural-ablative",
                             "%spellout-ordinal-masculine",
                             "%spellout-ordinal-neuter",
                             "%spellout-ordinal-feminine",
                             "%spellout-ordinal-plural",
                             "%spellout-ordinal-masculine-genitive",
                             "%spellout-ordinal-neuter-genitive",
                             "%spellout-ordinal-feminine-genitive",
                             "%spellout-ordinal-plural-genitive",
                             "%spellout-ordinal-masculine-dative",
                             "%spellout-ordinal-neuter-dative",
                             "%spellout-ordinal-feminine-dative",
                             "%spellout-ordinal-plural-dative",
                             "%spellout-ordinal-masculine-accusative",
                             "%spellout-ordinal-neuter-accusative",
                             "%spellout-ordinal-feminine-accusative",
                             "%spellout-ordinal-plural-accusative",
                             "%spellout-ordinal-masculine-locative",
                             "%spellout-ordinal-neuter-locative",
                             "%spellout-ordinal-feminine-locative",
                             "%spellout-ordinal-plural-locative",
                             "%spellout-ordinal-masculine-ablative",
                             "%spellout-ordinal-neuter-ablative",
                             "%spellout-ordinal-feminine-ablative",
                             "%spellout-ordinal-plural-ablative"]
        
        XCTAssert(rules.count >= expectedRules.count)
        
        for expectedRule in expectedRules {
            XCTAssertTrue(rules.contains(expectedRule))
        }
    }
    
    func testSpelloutNumberingYear() {
        formatter.setRuleSet("%spellout-numbering-year")
        XCTAssertEqual(formatter.string(from: 1), "первого")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатого")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатого")
        XCTAssertEqual(formatter.string(from: 20), "двадцатого")
        XCTAssertEqual(formatter.string(from: 42), "сорок второго")
        XCTAssertEqual(formatter.string(from: 100), "сотого")
    }
    
    func testSpelloutNumbering() {
        formatter.setRuleSet("%spellout-numbering")
        XCTAssertEqual(formatter.string(from: 1), "один")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцать")
        XCTAssertEqual(formatter.string(from: 12), "двенадцать")
        XCTAssertEqual(formatter.string(from: 20), "двадцать")
        XCTAssertEqual(formatter.string(from: 42), "сорок два")
        XCTAssertEqual(formatter.string(from: 100), "сто")
    }
    
    func testSpelloutCardinalMasculine() {
        formatter.setRuleSet("%spellout-cardinal-masculine")
        XCTAssertEqual(formatter.string(from: 1), "один")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцать")
        XCTAssertEqual(formatter.string(from: 12), "двенадцать")
        XCTAssertEqual(formatter.string(from: 20), "двадцать")
        XCTAssertEqual(formatter.string(from: 42), "сорок два")
        XCTAssertEqual(formatter.string(from: 100), "сто")
    }
    
    func testSpelloutCardinalNeuter() {
        formatter.setRuleSet("%spellout-cardinal-neuter")
        XCTAssertEqual(formatter.string(from: 1), "одно")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцать")
        XCTAssertEqual(formatter.string(from: 12), "двенадцать")
        XCTAssertEqual(formatter.string(from: 20), "двадцать")
        XCTAssertEqual(formatter.string(from: 42), "сорок два")
        XCTAssertEqual(formatter.string(from: 100), "сто")
    }
    
    func testSpelloutCardinalFeminine() {
        formatter.setRuleSet("%spellout-cardinal-feminine")
        XCTAssertEqual(formatter.string(from: 1), "одна")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцать")
        XCTAssertEqual(formatter.string(from: 12), "двенадцать")
        XCTAssertEqual(formatter.string(from: 20), "двадцать")
        XCTAssertEqual(formatter.string(from: 42), "сорок две")
        XCTAssertEqual(formatter.string(from: 100), "сто")
    }
    
    func testSpelloutCardinalPlural() {
        formatter.setRuleSet("%spellout-cardinal-plural")
        XCTAssertEqual(formatter.string(from: 1), "одни")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцать")
        XCTAssertEqual(formatter.string(from: 12), "двенадцать")
        XCTAssertEqual(formatter.string(from: 20), "двадцать")
        XCTAssertEqual(formatter.string(from: 42), "сорок две")
        XCTAssertEqual(formatter.string(from: 100), "сто")
    }
    
    func testSpelloutCardinalMasculineGenitive() {
        formatter.setRuleSet("%spellout-cardinal-masculine-genitive")
        XCTAssertEqual(formatter.string(from: 1), "одного")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцати")
        XCTAssertEqual(formatter.string(from: 12), "двенадцати")
        XCTAssertEqual(formatter.string(from: 20), "двадцати")
        XCTAssertEqual(formatter.string(from: 42), "сорока двух")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutCardinalNeuterGenitive() {
        formatter.setRuleSet("%spellout-cardinal-neuter-genitive")
        XCTAssertEqual(formatter.string(from: 1), "одного")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцати")
        XCTAssertEqual(formatter.string(from: 12), "двенадцати")
        XCTAssertEqual(formatter.string(from: 20), "двадцати")
        XCTAssertEqual(formatter.string(from: 42), "сорока двух")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutCardinalFeminineGenitive() {
        formatter.setRuleSet("%spellout-cardinal-feminine-genitive")
        XCTAssertEqual(formatter.string(from: 1), "одной")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцати")
        XCTAssertEqual(formatter.string(from: 12), "двенадцати")
        XCTAssertEqual(formatter.string(from: 20), "двадцати")
        XCTAssertEqual(formatter.string(from: 42), "сорока двух")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutCardinalPluralGenitive() {
        formatter.setRuleSet("%spellout-cardinal-plural-genitive")
        XCTAssertEqual(formatter.string(from: 1), "одних")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцати")
        XCTAssertEqual(formatter.string(from: 12), "двенадцати")
        XCTAssertEqual(formatter.string(from: 20), "двадцати")
        XCTAssertEqual(formatter.string(from: 42), "сорока двух")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutCardinalMasculineDative() {
        formatter.setRuleSet("%spellout-cardinal-masculine-dative")
        XCTAssertEqual(formatter.string(from: 1), "одному")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцати")
        XCTAssertEqual(formatter.string(from: 12), "двенадцати")
        XCTAssertEqual(formatter.string(from: 20), "двадцати")
        XCTAssertEqual(formatter.string(from: 42), "сорока двум")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutCardinalNeuterDative() {
        formatter.setRuleSet("%spellout-cardinal-neuter-dative")
        XCTAssertEqual(formatter.string(from: 1), "одному")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцати")
        XCTAssertEqual(formatter.string(from: 12), "двенадцати")
        XCTAssertEqual(formatter.string(from: 20), "двадцати")
        XCTAssertEqual(formatter.string(from: 42), "сорока двум")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutCardinalFeminineDative() {
        formatter.setRuleSet("%spellout-cardinal-feminine-dative")
        XCTAssertEqual(formatter.string(from: 1), "одной")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцати")
        XCTAssertEqual(formatter.string(from: 12), "двенадцати")
        XCTAssertEqual(formatter.string(from: 20), "двадцати")
        XCTAssertEqual(formatter.string(from: 42), "сорока двум")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutCardinalPluralDative() {
        formatter.setRuleSet("%spellout-cardinal-plural-dative")
        XCTAssertEqual(formatter.string(from: 1), "одним")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцати")
        XCTAssertEqual(formatter.string(from: 12), "двенадцати")
        XCTAssertEqual(formatter.string(from: 20), "двадцати")
        XCTAssertEqual(formatter.string(from: 42), "сорока двум")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutCardinalMasculineAccusative() {
        formatter.setRuleSet("%spellout-cardinal-masculine-accusative")
        XCTAssertEqual(formatter.string(from: 1), "один")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцать")
        XCTAssertEqual(formatter.string(from: 12), "двенадцать")
        XCTAssertEqual(formatter.string(from: 20), "двадцать")
        XCTAssertEqual(formatter.string(from: 42), "сорок два")
        XCTAssertEqual(formatter.string(from: 100), "сто")
    }
    
    func testSpelloutCardinalNeuterAccusative() {
        formatter.setRuleSet("%spellout-cardinal-neuter-accusative")
        XCTAssertEqual(formatter.string(from: 1), "одно")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцать")
        XCTAssertEqual(formatter.string(from: 12), "двенадцать")
        XCTAssertEqual(formatter.string(from: 20), "двадцать")
        XCTAssertEqual(formatter.string(from: 42), "сорок два")
        XCTAssertEqual(formatter.string(from: 100), "сто")
    }
    
    func testSpelloutCardinalFeminineAccusative() {
        formatter.setRuleSet("%spellout-cardinal-feminine-accusative")
        XCTAssertEqual(formatter.string(from: 1), "одну")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцать")
        XCTAssertEqual(formatter.string(from: 12), "двенадцать")
        XCTAssertEqual(formatter.string(from: 20), "двадцать")
        XCTAssertEqual(formatter.string(from: 42), "сорок две")
        XCTAssertEqual(formatter.string(from: 100), "сто")
    }
    
    func testSpelloutCardinalPluralAccusative() {
        formatter.setRuleSet("%spellout-cardinal-plural-accusative")
        XCTAssertEqual(formatter.string(from: 1), "одни")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцать")
        XCTAssertEqual(formatter.string(from: 12), "двенадцать")
        XCTAssertEqual(formatter.string(from: 20), "двадцать")
        XCTAssertEqual(formatter.string(from: 42), "сорок две")
        XCTAssertEqual(formatter.string(from: 100), "сто")
    }
    
    func testSpelloutCardinalMasculineLocative() {
        formatter.setRuleSet("%spellout-cardinal-masculine-locative")
        XCTAssertEqual(formatter.string(from: 1), "одном")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцати")
        XCTAssertEqual(formatter.string(from: 12), "двенадцати")
        XCTAssertEqual(formatter.string(from: 20), "двадцать")
        XCTAssertEqual(formatter.string(from: 42), "сорока двух")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutCardinalNeuterLocative() {
        formatter.setRuleSet("%spellout-cardinal-neuter-locative")
        XCTAssertEqual(formatter.string(from: 1), "одном")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцати")
        XCTAssertEqual(formatter.string(from: 12), "двенадцати")
        XCTAssertEqual(formatter.string(from: 20), "двадцати")
        XCTAssertEqual(formatter.string(from: 42), "сорока двух")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutCardinalFeminineLocative() {
        formatter.setRuleSet("%spellout-cardinal-feminine-locative")
        XCTAssertEqual(formatter.string(from: 1), "одной")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцати")
        XCTAssertEqual(formatter.string(from: 12), "двенадцати")
        XCTAssertEqual(formatter.string(from: 20), "двадцати")
        XCTAssertEqual(formatter.string(from: 42), "сорока двух")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutCardinalPluralLocative() {
        formatter.setRuleSet("%spellout-cardinal-plural-locative")
        XCTAssertEqual(formatter.string(from: 1), "одних")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцати")
        XCTAssertEqual(formatter.string(from: 12), "двенадцати")
        XCTAssertEqual(formatter.string(from: 20), "двадцати")
        XCTAssertEqual(formatter.string(from: 42), "сорока двух")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutCardinalMasculineAblative() {
        formatter.setRuleSet("%spellout-cardinal-masculine-ablative")
        XCTAssertEqual(formatter.string(from: 1), "одним")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатью")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатью")
        XCTAssertEqual(formatter.string(from: 20), "двадцатью")
        XCTAssertEqual(formatter.string(from: 42), "сорока двумя")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutCardinalNeuterAblative() {
        formatter.setRuleSet("%spellout-cardinal-neuter-ablative")
        XCTAssertEqual(formatter.string(from: 1), "одним")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатью")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатью")
        XCTAssertEqual(formatter.string(from: 20), "двадцатью")
        XCTAssertEqual(formatter.string(from: 42), "сорока двумя")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutCardinalFeminineAblative() {
        formatter.setRuleSet("%spellout-cardinal-feminine-ablative")
        XCTAssertEqual(formatter.string(from: 1), "одной")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатью")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатью")
        XCTAssertEqual(formatter.string(from: 20), "двадцатью")
        XCTAssertEqual(formatter.string(from: 42), "сорока двумя")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutCardinalPluralAblative() {
        formatter.setRuleSet("%spellout-cardinal-plural-ablative")
        XCTAssertEqual(formatter.string(from: 1), "одними")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатью")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатью")
        XCTAssertEqual(formatter.string(from: 20), "двадцатью")
        XCTAssertEqual(formatter.string(from: 42), "сорока двумя")
        XCTAssertEqual(formatter.string(from: 100), "ста")
    }
    
    func testSpelloutOrdinalMasculine() {
        formatter.setRuleSet("%spellout-ordinal-masculine")
        XCTAssertEqual(formatter.string(from: 1), "первый")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатый")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатый")
        XCTAssertEqual(formatter.string(from: 20), "двадцатый")
        XCTAssertEqual(formatter.string(from: 42), "сорок второй")
        XCTAssertEqual(formatter.string(from: 100), "сотый")
    }
    
    func testSpelloutOrdinalNeuter() {
        formatter.setRuleSet("%spellout-ordinal-neuter")
        XCTAssertEqual(formatter.string(from: 1), "первое")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатое")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатое")
        XCTAssertEqual(formatter.string(from: 20), "двадцатое")
        XCTAssertEqual(formatter.string(from: 42), "сорок второе")
        XCTAssertEqual(formatter.string(from: 100), "сотое")
    }
    
    func testSpelloutOrdinalFeminine() {
        formatter.setRuleSet("%spellout-ordinal-feminine")
        XCTAssertEqual(formatter.string(from: 1), "первая")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатая")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатая")
        XCTAssertEqual(formatter.string(from: 20), "двадцатая")
        XCTAssertEqual(formatter.string(from: 42), "сорок вторая")
        XCTAssertEqual(formatter.string(from: 100), "сотая")
    }
    
    func testSpelloutOrdinalPlural() {
        formatter.setRuleSet("%spellout-ordinal-plural")
        XCTAssertEqual(formatter.string(from: 1), "первые")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатые")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатые")
        XCTAssertEqual(formatter.string(from: 20), "двадцатые")
        XCTAssertEqual(formatter.string(from: 42), "сорок вторые")
        XCTAssertEqual(formatter.string(from: 100), "сотые")
    }
    
    func testSpelloutOrdinalMasculineGenitive() {
        formatter.setRuleSet("%spellout-ordinal-masculine-genitive")
        XCTAssertEqual(formatter.string(from: 1), "первого")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатого")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатого")
        XCTAssertEqual(formatter.string(from: 20), "двадцатого")
        XCTAssertEqual(formatter.string(from: 42), "сорок второго")
        XCTAssertEqual(formatter.string(from: 100), "сотого")
    }
    
    func testSpelloutOrdinalNeuterGenitive() {
        formatter.setRuleSet("%spellout-ordinal-neuter-genitive")
        XCTAssertEqual(formatter.string(from: 1), "первого")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатого")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатого")
        XCTAssertEqual(formatter.string(from: 20), "двадцатого")
        XCTAssertEqual(formatter.string(from: 42), "сорок второго")
        XCTAssertEqual(formatter.string(from: 100), "сотого")
    }
    
    func testSpelloutOrdinalFeminineGenitive() {
        formatter.setRuleSet("%spellout-ordinal-feminine-genitive")
        XCTAssertEqual(formatter.string(from: 1), "первой")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатой")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатой")
        XCTAssertEqual(formatter.string(from: 20), "двадцатой")
        XCTAssertEqual(formatter.string(from: 42), "сорок второй")
        XCTAssertEqual(formatter.string(from: 100), "сотой")
    }
    
    func testSpelloutOrdinalPluralGenitive() {
        formatter.setRuleSet("%spellout-ordinal-plural-genitive")
        XCTAssertEqual(formatter.string(from: 1), "первых")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатых")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатых")
        XCTAssertEqual(formatter.string(from: 20), "двадцатых")
        XCTAssertEqual(formatter.string(from: 42), "сорок вторых")
        XCTAssertEqual(formatter.string(from: 100), "сотых")
    }
    
    func testSpelloutOrdinalMasculineDative() {
        formatter.setRuleSet("%spellout-ordinal-masculine-dative")
        XCTAssertEqual(formatter.string(from: 1), "первому")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатому")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатому")
        XCTAssertEqual(formatter.string(from: 20), "двадцатому")
        XCTAssertEqual(formatter.string(from: 42), "сорок второму")
        XCTAssertEqual(formatter.string(from: 100), "сотому")
    }
    
    func testSpelloutOrdinalNeuterDative() {
        formatter.setRuleSet("%spellout-ordinal-neuter-dative")
        XCTAssertEqual(formatter.string(from: 1), "первому")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатому")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатому")
        XCTAssertEqual(formatter.string(from: 20), "двадцатому")
        XCTAssertEqual(formatter.string(from: 42), "сорок второму")
        XCTAssertEqual(formatter.string(from: 100), "сотому")
    }
    
    func testSpelloutOrdinalFeminineDative() {
        formatter.setRuleSet("%spellout-ordinal-feminine-dative")
        XCTAssertEqual(formatter.string(from: 1), "первой")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатой")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатой")
        XCTAssertEqual(formatter.string(from: 20), "двадцатой")
        XCTAssertEqual(formatter.string(from: 42), "сорок второй")
        XCTAssertEqual(formatter.string(from: 100), "сотой")
    }
    
    func testSpelloutOrdinalPluralDative() {
        formatter.setRuleSet("%spellout-ordinal-plural-dative")
        XCTAssertEqual(formatter.string(from: 1), "первым")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатым")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатым")
        XCTAssertEqual(formatter.string(from: 20), "двадцатым")
        XCTAssertEqual(formatter.string(from: 42), "сорок вторым")
        XCTAssertEqual(formatter.string(from: 100), "сотым")
    }
    
    func testSpelloutOrdinalMasculineAccusative() {
        formatter.setRuleSet("%spellout-ordinal-masculine-accusative")
        XCTAssertEqual(formatter.string(from: 1), "первый")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатый")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатый")
        XCTAssertEqual(formatter.string(from: 20), "двадцатый")
        XCTAssertEqual(formatter.string(from: 42), "сорок второй")
        XCTAssertEqual(formatter.string(from: 100), "сотый")
    }
    
    func testSpelloutOrdinalNeuterAccusative() {
        formatter.setRuleSet("%spellout-ordinal-neuter-accusative")
        XCTAssertEqual(formatter.string(from: 1), "первое")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатое")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатое")
        XCTAssertEqual(formatter.string(from: 20), "двадцатое")
        XCTAssertEqual(formatter.string(from: 42), "сорок второе")
        XCTAssertEqual(formatter.string(from: 100), "сотое")
    }
    
    func testSpelloutOrdinalFeminineAccusative() {
        formatter.setRuleSet("%spellout-ordinal-feminine-accusative")
        XCTAssertEqual(formatter.string(from: 1), "первую")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатую")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатую")
        XCTAssertEqual(formatter.string(from: 20), "двадцатую")
        XCTAssertEqual(formatter.string(from: 42), "сорок вторую")
        XCTAssertEqual(formatter.string(from: 100), "сотую")
    }
    
    func testSpelloutOrdinalPluralAccusative() {
        formatter.setRuleSet("%spellout-ordinal-plural-accusative")
        XCTAssertEqual(formatter.string(from: 1), "первые")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатые")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатые")
        XCTAssertEqual(formatter.string(from: 20), "двадцатые")
        XCTAssertEqual(formatter.string(from: 42), "сорок вторые")
        XCTAssertEqual(formatter.string(from: 100), "сотые")
    }
    
    func testSpelloutOrdinalMasculineLocative() {
        formatter.setRuleSet("%spellout-ordinal-masculine-locative")
        XCTAssertEqual(formatter.string(from: 1), "первом")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатом")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатом")
        XCTAssertEqual(formatter.string(from: 20), "двадцатом")
        XCTAssertEqual(formatter.string(from: 42), "сорок втором")
        XCTAssertEqual(formatter.string(from: 100), "сотом")
    }
    
    func testSpelloutOrdinalNeuterLocative() {
        formatter.setRuleSet("%spellout-ordinal-neuter-locative")
        XCTAssertEqual(formatter.string(from: 1), "первом")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатом")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатом")
        XCTAssertEqual(formatter.string(from: 20), "двадцатом")
        XCTAssertEqual(formatter.string(from: 42), "сорок втором")
        XCTAssertEqual(formatter.string(from: 100), "сотом")
    }
    
    func testSpelloutOrdinalFeminineLocative() {
        formatter.setRuleSet("%spellout-ordinal-feminine-locative")
        XCTAssertEqual(formatter.string(from: 1), "первой")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатой")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатой")
        XCTAssertEqual(formatter.string(from: 20), "двадцатой")
        XCTAssertEqual(formatter.string(from: 42), "сорок второй")
        XCTAssertEqual(formatter.string(from: 100), "сотой")
    }
    
    func testSpelloutOrdinalPluralLocative() {
        formatter.setRuleSet("%spellout-ordinal-plural-locative")
        XCTAssertEqual(formatter.string(from: 1), "первых")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатых")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатых")
        XCTAssertEqual(formatter.string(from: 20), "двадцатых")
        XCTAssertEqual(formatter.string(from: 42), "сорок вторых")
        XCTAssertEqual(formatter.string(from: 100), "сотых")
    }
    
    func testSpelloutOrdinalMasculineAblative() {
        formatter.setRuleSet("%spellout-ordinal-masculine-ablative")
        XCTAssertEqual(formatter.string(from: 1), "первым")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатым")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатым")
        XCTAssertEqual(formatter.string(from: 20), "двадцатым")
        XCTAssertEqual(formatter.string(from: 42), "сорок вторым")
        XCTAssertEqual(formatter.string(from: 100), "сотым")
    }
    
    func testSpelloutOrdinalNeuterAblative() {
        formatter.setRuleSet("%spellout-ordinal-neuter-ablative")
        XCTAssertEqual(formatter.string(from: 1), "первым")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатым")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатым")
        XCTAssertEqual(formatter.string(from: 20), "двадцатым")
        XCTAssertEqual(formatter.string(from: 42), "сорок вторым")
        XCTAssertEqual(formatter.string(from: 100), "сотым")
    }
    
    func testSpelloutOrdinalFeminineAblative() {
        formatter.setRuleSet("%spellout-ordinal-feminine-ablative")
        XCTAssertEqual(formatter.string(from: 1), "первой")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатой")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатой")
        XCTAssertEqual(formatter.string(from: 20), "двадцатой")
        XCTAssertEqual(formatter.string(from: 42), "сорок второй")
        XCTAssertEqual(formatter.string(from: 100), "сотой")
    }
    
    func testSpelloutOrdinalPluralAblative() {
        formatter.setRuleSet("%spellout-ordinal-plural-ablative")
        XCTAssertEqual(formatter.string(from: 1), "первыми")
        XCTAssertEqual(formatter.string(from: 11), "одиннадцатыми")
        XCTAssertEqual(formatter.string(from: 12), "двенадцатыми")
        XCTAssertEqual(formatter.string(from: 20), "двадцатыми")
        XCTAssertEqual(formatter.string(from: 42), "сорок вторыми")
        XCTAssertEqual(formatter.string(from: 100), "сотыми")
    }

    
}
