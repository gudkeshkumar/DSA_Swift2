//
//  File.swift
//  SortingAlgos
//
//  Created by apple on 18/07/21.
//

/*
     Criteria for analysing sorts
     1- Number of comparisons
     2- Number of swaps
     3- Adaptive (Must take minimum time when already sorted)
     4- Stable (Order must be preserved)
     5- Extra space
 
 */

import Foundation
func bubbleSort(_ array: [Int]) -> [Int] {
    guard !array.isEmpty else {
        return array
    }
    var ans = array
    let n = array .count
    var isWsapped = false
    for i in 0..<(n - 1) {
        for j in 0..<(n - i - 1) {
            if ans[j] > ans[j + 1] {
                (ans[j], ans[j + 1]) = (ans[j + 1], ans[j])
                isWsapped = true
            }
        }
        if !isWsapped {
            break
        }
    }
    
    return ans
}
