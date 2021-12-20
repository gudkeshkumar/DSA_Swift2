//
//  QuickSort.swift
//  SortingAlgos
//
//  Created by apple on 18/07/21.
//

import Foundation

/*
 Quick sort is also a divide and conquer algorithm
 */

func swap(_ a: inout [Int], i: Int, j: Int) {
    let temp = a[i]
    a[i] = a[j]
    a[j] = temp
}

func partition( _ arr: inout [Int], low: Int, high: Int) -> Int {
    var i = low - 1
    let pivot = arr[high]
    
    for j in low...high {
        if arr[j] < pivot {
            i += 1
            swap(&arr, i: i, j: j)
        }
    }
    
    swap(&arr, i: i + 1, j: high)
    return i + 1
}

func quickSort(_ arr: inout [Int], low: Int, high: Int) {
    if low < high {
        let pivot = partition(&arr, low: low, high: high)
        quickSort(&arr, low: low, high: pivot - 1)
        quickSort(&arr, low: pivot + 1, high: high)
    }
}
