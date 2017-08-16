//
//  RationalTests.swift
//  RationalTests
//
//  Created by Timothy Rodgers on 15/08/2017.
//  Copyright © 2017 Timothy Rodgers. All rights reserved.
//

import XCTest
@testable import Rational

class RationalTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDecimal() {
        var rational = Rational(fromDouble: 1.5)
        XCTAssertEqual(rational.description, "1 1/2")
        rational = Rational(fromDouble: 0.666667)
        XCTAssertEqual(rational.description, "2/3")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testOperators() {
        var lhs = Rational(numerator: 2, denominator: 3)
        var rhs = Rational(numerator: 1, denominator: 3)
        let resultMinus = Rational(numerator: 1, denominator: 3)
        let resultAdd = Rational(numerator: 3, denominator: 3)
        XCTAssertEqual(lhs-rhs, resultMinus)
        XCTAssertEqual(lhs+rhs, resultAdd)
        lhs = Rational(numerator: 1, denominator: 2)
        rhs = Rational(numerator: 1, denominator: 2)
        var resultMultiplication = Rational(numerator: 1, denominator: 4)
        let resultDivision = Rational(numerator: 1, denominator: 1)
        XCTAssertEqual(resultMultiplication, lhs*rhs)
        XCTAssertEqual(resultDivision, lhs/rhs)
        lhs = Rational(numerator: 4, denominator: 2)
        rhs = Rational(numerator: 1, denominator: 2)
        resultMultiplication = Rational(fromDouble: 1)
        XCTAssertEqual(resultMultiplication, lhs*rhs)
    }
    
    func testEquatable() {
        let lhs = Rational(numerator: 2, denominator: 3)
        var rhs = Rational(numerator: 2, denominator: 3)
        XCTAssertEqual(lhs, rhs)
        rhs = Rational(numerator: 4, denominator: 6)
        XCTAssertEqual(lhs, rhs)
    }
    
    func testComparable() {
        var lhs = Rational(numerator: 6, denominator: 3)
        var rhs = Rational(numerator: 2, denominator: 3)
        XCTAssertGreaterThan(lhs, rhs)
        lhs = Rational(numerator: 1, denominator: 3)
        rhs = Rational(numerator: 2, denominator: 3)
        XCTAssertLessThan(lhs, rhs)
        lhs = Rational(numerator: 1, denominator: 3)
        rhs = Rational(numerator: 2, denominator: 6)
        XCTAssertLessThanOrEqual(lhs, rhs)
        lhs = Rational(numerator: 7, denominator: 8)
        rhs = Rational(numerator: 3, denominator: 4)
        XCTAssertGreaterThanOrEqual(lhs, rhs)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
