//
//  TransliteratorTests.swift
//  NumberSpellOutFormatter-Unit-Tests
//
//  Created by Dmitry Matyukhin on 28/09/2018.
//

import XCTest
@testable import NumberSpellOutFormatter

class TransliteratorTests: XCTestCase {

    func testSupported() {
        let list = DMTransliterator.availableTransliterations()
        XCTAssert(list.count > 0)
        list.forEach {
            print($0)
        }
    }
    
    func testTransliterateLatin() {
        let t = DMTransliterator.toLatin
        
        XCTAssertEqual(t.transliterate("你好"), "nǐ hǎo")
        XCTAssertEqual(t.transliterate("привет"), "privet")
        XCTAssertEqual(t.transliterate("مرحبا"), "mrḥbạ")
        XCTAssertEqual(t.transliterate("สวัสดี"), "s̄wạs̄dī")
    }
    
    func testTransliterateFromJapanese() {
        let t = DMTransliterator.toLatin("ja")
        
        XCTAssertEqual(t.transliterate("今日は"), "kyou ha")
        XCTAssertEqual(t.transliterate("一"), "hito")
    }
    
    func testTransliterateRussian() {
        guard let t = DMTransliterator(id: "ru-zh", direction: .forward) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(t.transliterate("чебурашка"), "切布拉什卡")
    }

}
