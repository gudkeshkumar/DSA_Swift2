//
//  Problems_Array.swift
//  DSA
//
//  Created by Gudkesh on 04/01/22.
//

import Foundation

/*
 
 Two sum problem
 
 find the indices of pair or all the pairs which sums equal to a target sum
 
 */

@discardableResult
func twoSum(_ array: [Int], target: Int) -> [[Int]] {
    var dict = [Int: Int]()
    var ans = [[Int]]()
    for (index, item) in array.enumerated() {
        let targetValue = target - item
        if let ind = dict[item], ind  >= 0 {
            ans.append([ind, index]) 
        }
        
        dict[targetValue] = index
    }
    
    return ans
}

/*
 
 max area or max water container problem
 
 find the max area formd by the walls height defined in an array
 
 */

@discardableResult
func maxArea(_ arr: [Int]) -> Int {
    var maxArea = 0
    var start = 0
    var end = arr.count - 1
    
    while start <= end {
        let area = min(arr[start], arr[end]) * (end - start)
        maxArea = max(maxArea, area)
        
        if arr[start] <= arr[end] {
            start += 1
        } else {
            end -= 1
        }
    }
    
    return maxArea
}
