//
//  Pascal'sTriangle.swift
//  Help
//
//  Created by Sergey Lukaschuk on 10.01.2022.
//

import Foundation


// MARK: Pascal's Triangle
/*
 
 Given an integer numRows, return the first numRows of Pascal's triangle.
 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:
 
 Example 1:
 Input: numRows = 5
 Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
 
 Example 2:
 Input: numRows = 1
 Output: [[1]]
 
 */



func generate(_ numRows: Int) -> [[Int]] {
    
    guard numRows > 0 else { return [] }
    if numRows == 1 { return [[1]] }
    
    var results = [[Int]]()
    results.append([1])
    
    for x in 1..<numRows {
        var newRow = [1]
        let prevRow = results[x - 1]
        
        for j in 1..<prevRow.count {
            let sum = prevRow[j] + prevRow[j - 1]
            newRow.append(sum)
        }
        newRow.append(1)
        results.append(newRow)
    }

    return results
}
