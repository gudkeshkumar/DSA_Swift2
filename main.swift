//
//  main.swift
//  SortingAlgos
//
//  Created by Gudkesh on 18/07/21.
//

import Foundation

var arr: [Int] =  [6,4,7,5,1,2,8,3]
//quickSort(&arr, low: 0, high: arr.count - 1)
//let ans = twoSum(arr, target: 10)
//let ans = maxArea(arr)
//
//print(ans)

example(of: "DLList") {
    let list = DLList<Int>()
    for i in arr {
        list.push(i)
    }
    
    print(list)
    list.append(9)
    list.insert(11, after: list.node(at: 8))
    print(list)
    
    list.removeNode(after: list.node(at: 4))
    list.pop()
    list.removeLast()
    
}


