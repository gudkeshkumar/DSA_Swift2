//
//  Problems_Rec.swift
//  DSA
//
//  Created by Gudkesh on 25/02/22.
//

import Foundation
/*
 90. Subsets II
 Medium
 Given an integer array nums that may contain duplicates, return all possible subsets (the power set).

 The solution set must not contain duplicate subsets. Return the solution in any order.

  

 Example 1:

 Input: nums = [1,2,2]
 Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]
 Example 2:

 Input: nums = [0]
 Output: [[],[0]]
 */


func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var ans = Set<[Int]>()
    var sub = [Int]()
    getSubsets(0, &ans, &sub, nums)
    return Array(ans)
}

private func getSubsets(_ ind: Int, _ ans: inout Set<[Int]>, _ sub: inout [Int], _ nums: [Int]) {
    if ind == nums.count {
        ans.insert(sub.sorted())
        return
    }
    sub.append(nums[ind])
    getSubsets(ind+1, &ans, &sub, nums)
    sub.removeLast()
    getSubsets(ind+1, &ans, &sub, nums)
}

/*
 Print the susequence of an array which has sum equal to k
 Print any sequence
 get subsequence  count having sum = k
 */


func subsequenceSum(_ arr: [Int], _ sum: Int)  {
    var sub = [Int]()
    var curSum = 0
    getSubsequences(0, &sub, arr, &curSum, sum)
}

@discardableResult
private func getSubsequences(_ ind: Int, _ sub: inout [Int], _ arr: [Int], _ sum: inout Int, _ targetSum: Int) -> Bool {
    if ind == arr.count {
        if sum == targetSum {
            print(sub)
            return true
        }
        return false
    }
    sub.append(arr[ind])
    sum += arr[ind]
    if getSubsequences(ind+1, &sub, arr, &sum, targetSum) {return true}
    sub.removeLast()
    sum -= arr[ind]
    if getSubsequences(ind+1, &sub, arr, &sum, targetSum) {return true}
    
    return false
}

func subsequenceCount(_ arr: [Int], _ sum: Int) -> Int  {
    var curSum = 0
    return getSubsequencesCount(0, arr, &curSum, sum)
}

@discardableResult
private func getSubsequencesCount(_ ind: Int, _ arr: [Int], _ sum: inout Int, _ targetSum: Int) -> Int {
    if ind == arr.count {
        if sum == targetSum {
            return 1
        }
        return 0
    }
    sum += arr[ind]
    let l = getSubsequencesCount(ind+1,  arr, &sum, targetSum)
    sum -= arr[ind]
    let r = getSubsequencesCount(ind+1,  arr, &sum, targetSum)
    
    return l+r
}

/*
 39. Combination Sum
 Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

 The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

 It is guaranteed that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

  

 Example 1:

 Input: candidates = [2,3,6,7], target = 7
 Output: [[2,2,3],[7]]
 Explanation:
 2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
 7 is a candidate, and 7 = 7.
 These are the only two combinations.
 Example 2:

 Input: candidates = [2,3,5], target = 8
 Output: [[2,2,2,2],[2,3,3],[3,5]]
 Example 3:

 Input: candidates = [2], target = 1
 Output: []
 */
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans = [[Int]]()
        var sub = [Int]()
        getSubsequences(0, &ans, &sub, candidates, target)
        return ans
    }
    
private func getSubsequences(_ ind: Int, _ ans: inout [[Int]], _ sub: inout [Int], _ arr: [Int], _ targetSum: Int) {
    if ind == arr.count {
        if 0 == targetSum {
            ans.append(sub)
        }
        return
    }
    
    if arr[ind] <= targetSum {
       sub.append(arr[ind])
       getSubsequences(ind, &ans, &sub, arr,  targetSum-arr[ind])
       sub.removeLast()
    }
    
    getSubsequences(ind+1, &ans, &sub, arr, targetSum)
}

/*
 40. Combination Sum II
 Medium

 Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.

 Each number in candidates may only be used once in the combination.

 Note: The solution set must not contain duplicate combinations.

  

 Example 1:

 Input: candidates = [10,1,2,7,6,1,5], target = 8
 Output:
 [
 [1,1,6],
 [1,2,5],
 [1,7],
 [2,6]
 ]
 Example 2:

 Input: candidates = [2,5,2,1,2], target = 5
 Output:
 [
 [1,2,2],
 [5]
 ]
  

 Constraints:

 1 <= candidates.length <= 100
 1 <= candidates[i] <= 50
 1 <= target <= 30
 */

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
   var ans = [[Int]]()
   var sub = [Int]()
   let arr = candidates.sorted()
   getSubsets(0, &ans, &sub, arr, target)
   return Array(ans)
}

private func getSubsets(_ ind: Int, _ ans: inout [[Int]], _ sub: inout [Int], _ nums: [Int], _ target: Int) {
   if target == 0 {
        ans.append(sub)
       return
   }
   
   for i in ind..<nums.count {
       if i > ind && nums[i] == nums[i-1] {
           continue
       }
       
       if nums[i] > target {
           break
       }
       
       sub.append(nums[i])
       getSubsets(i+1, &ans, &sub, nums, target - nums[i])
       sub.removeLast()
   }
   
}

/*
 You are given an integer array nums and an integer target.

 You want to build an expression out of nums by adding one of the symbols '+' and '-' before each integer in nums and then concatenate all the integers.

 For example, if nums = [2, 1], you can add a '+' before 2 and a '-' before 1 and concatenate them to build the expression "+2-1".
 Return the number of different expressions that you can build, which evaluates to target.

  

 Example 1:

 Input: nums = [1,1,1,1,1], target = 3
 Output: 5
 Explanation: There are 5 ways to assign symbols to make the sum of nums be target 3.
 -1 + 1 + 1 + 1 + 1 = 3
 +1 - 1 + 1 + 1 + 1 = 3
 +1 + 1 - 1 + 1 + 1 = 3
 +1 + 1 + 1 - 1 + 1 = 3
 +1 + 1 + 1 + 1 - 1 = 3

 */
func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    let n = nums.count
    return targetSum(n, 0, nums, target)
    
}

private func targetSum(_ len: Int, _ ind: Int, _ nums: [Int], _ target: Int ) -> Int {
    if ind == len {
        if target == 0 {
            return 1
        }
        return 0
    }
    
    let positive = targetSum(len, ind+1, nums, target - nums[ind])
    let negative = targetSum(len, ind+1, nums, target - (-nums[ind]))
    return positive + negative
    
}
