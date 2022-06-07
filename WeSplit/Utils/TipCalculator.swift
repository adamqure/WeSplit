//
//  TipCalculator.swift
//  WeSplit
//
//  Created by Adam Ure on 6/6/22.
//

import Foundation

// MARK: Tip Calculator
struct TipCalculator {

    // MARK: Error Codes
    enum CalculatorError: Error {
       case invalidPercentage
    }

    // MARK: Static Methods

    /**
        Calculate the amount of tip owed based on the percentage and the check amount
        - Parameter check: The floating-point value of the check amount
        - Parameter percentage: The integer percent value of the tip to leave. In the human readable percentage value rather than the decimal value (e.g. 20%)
        - Returns: Returns a double representing the amount of tip expected based on the percentage
        - Throws: CalculatorError.invalidPercentage
        - Complexity: O(1)
     */
    static func calculateTip(of check: Double, withPercent percentage: Double) throws -> Double {
        guard percentage >= 0 else {
            throw CalculatorError.invalidPercentage
        }
        return (percentage / 100) * check
    }
}
