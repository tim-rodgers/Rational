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
    
    func testDoubleToRationalPrecise() {
        let rational = Rational(fromDouble: 1.5)
        XCTAssertEqual([rational.numerator,rational.denominator], [3,2])
        XCTAssertEqual(rational.description, "1 1/2")
    }
    
    func testDoubleToRationalApproximate() {
        let rational = Rational(fromDouble: 0.666667)
        XCTAssertEqual([rational.numerator,rational.denominator], [2,3])
        XCTAssertEqual(rational.description, "2/3")
    }
    
    func testAddTwoRational() {
        let lhs = Rational(numerator: 2, denominator: 3)
        let rhs = Rational(numerator: 1, denominator: 3)
        let resultAdd = Rational(numerator: 3, denominator: 3)
        XCTAssertEqual(lhs+rhs, resultAdd)
    }
    
    func testSubtractTwoRational() {
        let lhs = Rational(numerator: 2, denominator: 3)
        let rhs = Rational(numerator: 1, denominator: 3)
        let resultAdd = Rational(numerator: 3, denominator: 3)
        XCTAssertEqual(lhs-rhs, resultMinus)
    }
    
    func testMultiplyTwoRational() {
        let lhs = Rational(numerator: 1, denominator: 2)
       let  rhs = Rational(numerator: 1, denominator: 2)
        var resultMultiplication = Rational(numerator: 1, denominator: 4)
        XCTAssertEqual(resultMultiplication, lhs*rhs)
    }
    
    func testDivideTwoRational() {
        let lhs = Rational(numerator: 1, denominator: 2)
        let rhs = Rational(numerator: 1, denominator: 2)
        let resultDivision = Rational(numerator: 1, denominator: 1)
        XCTAssertEqual(resultDivision, lhs/rhs)
    }
    
    func testEqualSameRational() {
        let lhs = Rational(numerator: 2, denominator: 3)
        let rhs = Rational(numerator: 2, denominator: 3)
        XCTAssertEqual(lhs, rhs)
    }
    
    func testEqualDifferentRational() {
        let lhs = Rational(numerator: 2, denominator: 3)
        let rhs = Rational(numerator: 4, denominator: 6)
        XCTAssertEqual(lhs, rhs)
    }
    
    func testLessThan() {
        let lhs = Rational(numerator: 1, denominator: 3)
        let rhs = Rational(numerator: 2, denominator: 3)
        XCTAssertLessThan(lhs, rhs)
    }
    
    func testGreaterThan() {
        let lhs = Rational(numerator: 6, denominator: 3)
        vlet rhs = Rational(numerator: 2, denominator: 3)
        XCTAssertGreaterThan(lhs, rhs)
    }
    
    func testLessEqual() {
        let lhs = Rational(numerator: 1, denominator: 3)
        let rhs = Rational(numerator: 2, denominator: 6)
        XCTAssertLessThanOrEqual(lhs, rhs)
    }
    
    func testGreaterEqual() {
        let lhs = Rational(numerator: 7, denominator: 8)
        let rhs = Rational(numerator: 3, denominator: 4)
        XCTAssertGreaterThanOrEqual(lhs, rhs)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
