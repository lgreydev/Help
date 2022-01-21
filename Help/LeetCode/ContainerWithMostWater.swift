//
//  ContainerWithMostWater.swift
//  Help
//
//  Created by Sergey Lukaschuk on 21.01.2022.
//

import Foundation

// MARK: Container With Most Water

/*
 You are given an integer array `height` of length `n`. There are n vertical lines drawn such that the two endpoints of the `ith` line are `(i, 0)` and `(i, height[i])`.
 
 Find two lines that together with the x-axis form a container, such that the container contains the most water.

 Return the maximum amount of water a container can store.
 
 **Notice** that you may not slant the container.
 
 **Example 1:**<br>
 *Input:* `height = [1,8,6,2,5,4,8,3,7]` <br>
 *Output:* `49` <br>
 *Explanation:* The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
 
 **Example 2:**<br>
 *Input:* `height = [1,1]`<br>
 *Output:* `1`<br>
 
 */

func maxArea(_ height: [Int]) -> Int {
    guard !height.isEmpty else { return -1 }
    
    var maxArea = 0
    var left = 0
    var right = height.count - 1
    
    while left < right {
        // Re-calc maxArea
        let minHeight = min(height[left], height[right])
        let currentHeight = minHeight * (right - left)
        maxArea = max(maxArea, currentHeight)

        // Move pointers
        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
    }
    return maxArea
}

let input = [1, 8, 6, 2, 5, 4, 8, 3, 7]
let result = maxArea(input)
//print("Result: \(result)")
