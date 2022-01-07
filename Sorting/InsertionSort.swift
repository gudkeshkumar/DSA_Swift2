//
//  InsertionSort.swift
//  SortingAlgos
//
//  Created by Gudkesh on 18/07/21.
//

import Foundation
/*
 Insertion sort is adaptive by nature
 
 */
func insertionSort(_ array: [Int]) -> [Int] {
    guard !array.isEmpty else {
        return array
    }
    var ans = array
    let n = array.count
    
    for i in 1..<n {
        var j = i - 1
        let x = ans[i]
        while (j > -1) && ans[j] > x {
            ans[j + 1] = ans[j]
            j -= 1
        }
        
        ans[j + 1] = x
    }
    
    return ans
}
