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

/*
 658. Find K Closest Elements
 Medium

 Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array. The result should also be sorted in ascending order.

 An integer a is closer to x than an integer b if:

 |a - x| < |b - x|, or
 |a - x| == |b - x| and a < b
  

 Example 1:

 Input: arr = [1,2,3,4,5], k = 4, x = 3
 Output: [1,2,3,4]
 Example 2:

 Input: arr = [1,2,3,4,5], k = 4, x = -1
 Output: [1,2,3,4]

 */
func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        
        var l = 0
        var h = arr.count-1
        
        while h-l >= k {
            
            let low = abs(arr[l] - x)
            let high = abs(arr[h] - x)
            
            if low > high {
               l+=1
            } else {
                h-=1
            }
            
        }
        
        var ans = [Int]()
        for i in l...h {
           ans.append(arr[i])
        }
        
        return ans
    }
