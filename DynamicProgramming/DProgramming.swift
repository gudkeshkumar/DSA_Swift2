//
//  DProgramming.swift
//  DSA
//
//  Created by Gudkesh on 24/02/22.
//

import Foundation

/*
 Recursive Fibinaci number
 public func fib(_ n: Int) -> UInt {
     
     if n <= 2 {
         return 1
     }
     
     return fib(n-1) + fib(n-2)
 }
 */



// Memoization

public func fib(_ n: Int, memo: inout [Int: Int]) -> Int {
    
    if let val = memo[n] {
        return val
    }
    
    if n <= 2 {
        return 1
    }
    
    memo[n] = fib(n-1, memo: &memo) + fib(n-2, memo: &memo)
    return memo[n] ?? 0
}


// Grid Traveller
public func gridTraveller(_ row: Int, _ col: Int, memo: inout [String: Int]) -> Int {
    let m = row
    let n = col
    let key = "\(m),\(n)"
    if let val = memo[key] {
        return val
    }
    
    if m == 0 || n == 0 { return 0 }
    if m == 1 && n == 1 { return 1 }
    
    memo[key] = gridTraveller(m-1, n, memo: &memo) + gridTraveller(m, n-1, memo: &memo)
    
    return memo[key] ?? 0
}

// target sum problem , can you generate the target sum from array

public func canSum(_ target: Int, array: [Int], memo: inout [Int: Bool]) -> Bool {
    if let val = memo[target] { return val }
    if target == 0 { return true }
    if target < 0 { return false }
    
    for num in array {
        let rem = target - num
        if canSum(rem, array: array, memo: &memo) == true {
            memo[rem] = true
            return true
        }
    }
    memo[target] = false
    return false
}

