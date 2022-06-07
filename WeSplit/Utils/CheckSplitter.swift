//
//  CheckSplitter.swift
//  WeSplit
//
//  Created by Adam Ure on 6/6/22.
//

import Foundation

// MARK: Check Splitter
struct CheckSplitter {

    // MARK: Check Splitter Error
    enum CheckSplitterError: Error {
       case invalidSplitCount
    }

    // MARK: Static Methods

    /**
        Determines the cost per person of a balance when split into n number of pieces
        - Parameter balance: A floating-point value to be split into parts
        - Parameter count: An integer number of pieces into which the balance will be split
        - Returns: A floating-point value that represents the amount in each subsection
        - Throws: CheckSplittererror.invalidSplitCount
        - Complexity: O(1)
     */
    static func splitCheck(balance: Double, into count: Int) throws -> Double {
        guard count > 0 else {
            throw CheckSplitterError.invalidSplitCount
        }

        return balance / Double(count)
    }
}
