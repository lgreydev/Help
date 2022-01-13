//
//  SpiralMatrix.swift
//  Help
//
//  Created by Sergey Lukaschuk on 13.01.2022.
//

import Foundation


// MARK: Spiral Matrix

/*
 Given an m x n matrix, return all elements of the matrix in spiral order.
 
 Example 1
 Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [1,2,3,6,9,8,7,4,5]
 
 Example 2
 Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 */

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var result = [Int]()
    
    if matrix.count == 0 || matrix[0].count == 0 {
        return result
    }
    
    var left = 0
    var bottom = matrix.count - 1
    var top = 0
    var right = matrix[0].count - 1
    
    while (left <= bottom && top <= right) {
        // Go left to right
        for col in stride(from: top, through: right, by: 1) {
            result.append(matrix[left][col])
        }
        // Go top to down
        left += 1
        for row in stride(from: left, through: bottom, by: 1) {
            result.append(matrix[row][right])
        }
        // Go right to left
        right -= 1
        if left <= bottom {
            for col in stride(from: right, through: top, by: -1) {
                result.append(matrix[bottom][col])
            }
            bottom -= 1
        }
        // Go up
        if top <= right {
            for row in stride(from: bottom, through: left, by: -1) {
                result.append(matrix[row][top])
            }
            top += 1
        }
    }
    return result
}
