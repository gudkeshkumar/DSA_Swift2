//
//  MergeSort.swift
//  SortingAlgos
//
//  Created by Gudkesh on 18/07/21.
//

import Foundation

func mergeSort(_ arr: [Int]) -> [Int] {
    guard !arr.isEmpty else { return arr}
    if arr.count == 1 { return arr }
    let l = 0
    let r = arr.count - 1
    let m = l + ( r - l) / 2
    
    let l1 = mergeSort(Array(arr[l...m]))
    let l2 = mergeSort(Array(arr[m+1...r]))
    return merge(l1, l2)
}

func merge(_ a: [Int], _ b: [Int]) -> [Int] {
    var ans = [Int]()
    var s1 = 0
    var s2 = 0
    
    while s1 < a.count && s2 < b.count {
        if a[s1] < b[s2] {
            ans.append(a[s1])
            s1 += 1
        } else {
            ans.append(b[s2])
            s2 += 1
        }
    }
    
    while s1 < a.count  {
        ans.append(a[s1])
        s1 += 1
    }
    
    while s2 < b.count  {
        ans.append(b[s2])
        s2 += 1
    }
    
    return ans
}
