//
//  TipCalculatorTests.swift
//  WeSplitTests
//
//  Created by Adam Ure on 6/6/22.
//

import XCTest
@testable import WeSplit

class TipCalculatorTests: XCTestCase {

    func testCalculateNegativePercentageTipShouldThrow() {
        let tipPercentage: Double = -10
        let checkValue: Double = 10.0

        XCTAssertThrowsError(try TipCalculator.calculateTip(of: checkValue, withPercent: tipPercentage)) { error in
            XCTAssertEqual(error as? TipCalculator.CalculatorError, TipCalculator.CalculatorError.invalidPercentage)
        }
    }

    func testCalculateZeroPercentageTipShouldBeZero() {
        let tipPercentage: Double = 0
        let checkValue: Double = 10.0

        do {
            let value = try TipCalculator.calculateTip(of: checkValue, withPercent: tipPercentage)

            XCTAssertEqual(value, 0.0)
        } catch {
            XCTFail()
        }
    }

    func testCalculate10PercentageTipShouldBe1() {
        let tipPercentage: Double = 10.0
        let checkValue: Double = 10.0

        do {
            let value = try TipCalculator.calculateTip(of: checkValue, withPercent: tipPercentage)

            XCTAssertEqual(value, 1.0)
        } catch {
            XCTFail()
        }
    }

    func testCalculate100PercentageTipShouldBe10() {
        let tipPercentage: Double = 100.0
        let checkValue: Double = 10.0

        do {
            let value = try TipCalculator.calculateTip(of: checkValue, withPercent: tipPercentage)

            XCTAssertEqual(value, 10.0)
        } catch {
            XCTFail()
        }
    }

}
