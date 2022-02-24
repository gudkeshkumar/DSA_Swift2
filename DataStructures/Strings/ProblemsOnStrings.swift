//
//  ProblemsOnStrings.swift
//  DSA
//
//  Created by Gudkesh on 17/02/22.
//

import Foundation

/*
 You are given an integer num. You can swap two digits at most once to get the maximum valued number.
 Return the maximum valued number you can get.

 Example 1:

 Input: num = 2736
 Output: 7236
 Explanation: Swap the number 2 and the number 7.
 Example 2:

 Input: num = 9973
 Output: 9973
 Explanation: No swap.
 */
class Solution {
    func maximumSwap(_ num: Int) -> Int {
        if num == 0 {
            return 0
        }
        
        var digits = digitsFromNum(num)
        
        maxDigits(0, digits.count - 1, &digits)
        
        return numFromDigits(digits)
    }
    
    private func maxDigits(_ start: Int, _ end: Int, _ digits: inout [Int]) {
        if start > end {
            return
        }
        
        var maxDigit = 0
        var maxIndex = 0
        
        for i in start...end {
            if digits[i] > maxDigit {
                maxDigit = digits[i]
                maxIndex = i
            }
        }
        
        if maxDigit != digits[end] {
            
            (digits[end], digits[maxIndex]) = (digits[maxIndex],digits[end])
            return
        }
        
        maxDigits(start, end - 1, &digits)
    }
    
    private func digitsFromNum(_ num: Int) -> [Int] {
        var digits = [Int]()
        var num = num
        
        while num != 0 {
            digits.append(num % 10)
            num /= 10
        }

        return digits
    }
    
    private func numFromDigits(_ digits: [Int]) -> Int {
        var num = 0
        
        for i in 0..<digits.count {
            num += Int(pow(10, Double(i))) * digits[i]
        }
        
        return num
    }
}

func minimumMoves(arr1: [Int], arr2: [Int]) -> Int {
    // Write your code here
    var ans = 0
    
    for (a,b) in zip(arr1, arr2) {
        ans += getMoves(a, b)
    }
    
    return ans

}

func getMoves(_ a: Int, _ b: Int) -> Int {
    var ans = 0
    var a = a
    var b = b
    while a > 0 && b > 0 {
        let dig1 = a%10
        let dig2 = b%10
        
        ans += abs(dig1-dig2)
        a/=10
        b/=10
    }
    return ans
}
