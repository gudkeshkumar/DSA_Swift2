//
//  SelectionSort.swift
//  SortingAlgos
//
//  Created by Gudkesh on 18/07/21.
//

/*
  Find the position and put the min element there
 */
import Foundation

func selectionSort(_ array: [Int]) -> [Int] {
    guard !array.isEmpty else {
        return array
    }
    var ans = array
    let n = array.count
    
    for i in 0..<n {
        var mini = i
        for j in i..<n {
            if ans[j] < ans[mini] {
                mini = j
            }
        }
        (ans[i], ans[mini]) = (ans[mini], ans[i])
    }
    
    return ans
}
